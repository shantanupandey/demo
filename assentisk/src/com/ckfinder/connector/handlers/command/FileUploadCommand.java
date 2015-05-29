/*
 * CKFinder
 * ========
 * http://cksource.com/ckfinder
 * Copyright (C) 2007-2014, CKSource - Frederico Knabben. All rights reserved.
 *
 * The software, this file and its contents are subject to the CKFinder
 * License. Please read the license.txt file before using, installing, copying,
 * modifying or distribute this file or part of its contents. The contents of
 * this file is part of the Source Code of CKFinder.
 */
package com.ckfinder.connector.handlers.command;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.assentisk.dao.RegulationDao;
import com.ckfinder.connector.configuration.Constants;
import com.ckfinder.connector.configuration.IConfiguration;
import com.ckfinder.connector.configuration.Events.EventTypes;
import com.ckfinder.connector.data.AfterFileUploadEventArgs;
import com.ckfinder.connector.data.ResourceType;
import com.ckfinder.connector.errors.ConnectorException;
import com.ckfinder.connector.errors.ErrorUtils;
import com.ckfinder.connector.utils.AccessControlUtil;
import com.ckfinder.connector.utils.FileUtils;
import com.ckfinder.connector.utils.ImageUtils;
import com.oreilly.servlet.MultipartRequest;

/**
 * Class to handle
 * <code>FileUpload</code> command.
 */
public class FileUploadCommand extends Command implements IPostCommand {

	/**
	 * uploading file name request.
	 */
	protected RegulationDao regulationDao;
	protected String fileName;
	/**
	 * file name after rename.
	 */
	protected String newFileName;
	/**
	 * function number to call after file upload is completed.
	 */
	protected String ckEditorFuncNum;
	/**
	 * the selected response type to be used after file upload is completed.
	 */
	protected String responseType;
	/**
	 * function number to call after file upload is completed.
	 */
	protected String ckFinderFuncNum;
	/**
	 * connector language.
	 */
	private String langCode;
	/**
	 * flag if file was uploaded correctly.
	 */
	protected boolean uploaded;
	/**
	 * error code number.
	 */
	protected int errorCode;
	private static final char[] UNSAFE_FILE_NAME_CHARS = {':', '*', '?', '|', '/'};

	/**
	 * default constructor.
	 */
	public FileUploadCommand() {
		this.errorCode = 0;
		this.fileName = "";
		this.newFileName = "";
		this.type = "";
		this.uploaded = false;
	}

	/**
	 * execute file upload command.
	 *
	 * @param out output stream from response.
	 * @throws ConnectorException when error occurs.
	 */
	@Override
	public void execute(final OutputStream out) throws ConnectorException {
		if (configuration.isDebugMode() && this.exception != null) {
			throw new ConnectorException(this.errorCode, this.exception);
		}
		try {
			String errorMsg = (this.errorCode == 0) ? "" : ErrorUtils.getInstance().getErrorMsgByLangAndCode(this.langCode,
					this.errorCode, this.configuration);
			errorMsg = errorMsg.replaceAll("%1", Matcher.quoteReplacement(this.newFileName));
			String path = "";

			if (!uploaded) {
				this.newFileName = "";
				this.currentFolder = "";
			} else {
				path = configuration.getTypes().get(type).getUrl()
						+ this.currentFolder;
			}

			System.out.println("check the path>>>>>>"+path);
			if (this.responseType != null && this.responseType.equals("txt")) {
				out.write((this.newFileName + "|" + errorMsg).getBytes("UTF-8"));
			} else {
				out.write("<script type=\"text/javascript\">".getBytes("UTF-8"));
				if (checkFuncNum()) {
					handleOnUploadCompleteCallFuncResponse(out, errorMsg, path);
				} else {
					handleOnUploadCompleteResponse(out, errorMsg);
				}
				out.write("</script>".getBytes("UTF-8"));
			}

		} catch (IOException e) {
			throw new ConnectorException(
					Constants.Errors.CKFINDER_CONNECTOR_ERROR_ACCESS_DENIED, e);
		}

	}

	/**
	 * check if func num is set in request.
	 *
	 * @return true if is.
	 */
	protected boolean checkFuncNum() {
		return this.ckFinderFuncNum != null;
	}

	/**
	 * return response when func num is set.
	 *
	 * @param out response.
	 * @param errorMsg error message
	 * @param path path
	 * @throws IOException when error occurs.
	 */
	protected void handleOnUploadCompleteCallFuncResponse(final OutputStream out,
			final String errorMsg,
			final String path)
			throws IOException {
		this.ckFinderFuncNum = this.ckFinderFuncNum.replaceAll(
				"[^\\d]", "");
		out.write(("window.parent.CKFinder.tools.callFunction("
				+ this.ckFinderFuncNum + ", '"
				+ path
				+ FileUtils.backupWithBackSlash(this.newFileName, "'")
				+ "', '" + errorMsg + "');").getBytes("UTF-8"));
	}

	/**
	 *
	 * @param out out put stream
	 * @param errorMsg error message
	 * @throws IOException when error occurs
	 */
	protected void handleOnUploadCompleteResponse(final OutputStream out,
			final String errorMsg) throws IOException {
		out.write("window.parent.OnUploadCompleted(".getBytes("UTF-8"));
		out.write(("\'" + FileUtils.backupWithBackSlash(this.newFileName, "'") + "\'").getBytes("UTF-8"));
		out.write((", \'"
				+ (this.errorCode
				!= Constants.Errors.CKFINDER_CONNECTOR_ERROR_NONE ? errorMsg
				: "") + "\'").getBytes("UTF-8"));
		out.write(");".getBytes("UTF-8"));
	}

	/**
	 * initializing parametrs for command handler.
	 *
	 * @param request request
	 * @param configuration connector configuration.
	 * @param params execute additional params.
	 * @throws ConnectorException when error occurs.
	 */
	@Override
	public void initParams(final HttpServletRequest request,
			final IConfiguration configuration, final Object... params)
			throws ConnectorException {
		super.initParams(request, configuration, params);
		this.ckFinderFuncNum = request.getParameter("CKFinderFuncNum");
		this.ckEditorFuncNum = request.getParameter("CKEditorFuncNum");
		this.responseType = request.getParameter("response_type");
		this.langCode = request.getParameter("langCode");
		
		String type=request.getParameter("type");
		
		System.out.println("type>>>"+type);

		if (this.errorCode == Constants.Errors.CKFINDER_CONNECTOR_ERROR_NONE) {
			this.uploaded = uploadFile(request,type);
		}


	}

	/**
	 * uploads file and saves to file.
	 *
	 * @param request request
	 * @return true if uploaded correctly.
	 */
	private boolean uploadFile(final HttpServletRequest request,String Type) {
		if (!AccessControlUtil.getInstance(configuration).checkFolderACL(
				this.type, this.currentFolder, this.userRole,
				AccessControlUtil.CKFINDER_CONNECTOR_ACL_FILE_UPLOAD)) {
			this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_UNAUTHORIZED;
			return false;
		}
		return fileUpload(request,Type);
	}

	/**
	 *
	 * @param request http request
	 * @return true if uploaded correctly
	 */
	private boolean fileUpload(final HttpServletRequest request,String Type) {
		String saveFile = "";
		  String targetDir = "";
		  String testid = "";
		  
		  System.out.println("ttype inside the file upload*******>"+Type);
		  MultipartHttpServletRequest multi = null;
		  MultipartFile multipartFile = null;
		  targetDir = getContextPathForDirectory(request, "temp");
		  
		  
		  targetDir=targetDir;
		  System.out.println("Directory found is=" + targetDir);
		 
		  try {
			  
			  System.out.println("------------------------------"+targetDir);
		       if(Type.equals("Flash")){
		        targetDir=targetDir+"/flash";
		         System.out.println("hi here video"+targetDir); 
		       }
		       if(Type.equals("Images")){
		        targetDir=targetDir+"/images";
		         System.out.println("hi here image"+targetDir); 
		       }
		       if(Type.equals("Files")){
			        targetDir=targetDir+"/files";
			         System.out.println("hi here files"+targetDir); 
			       }
		       File tarDirFile = new File(targetDir);
		    String fileName = null;
		    if (!tarDirFile.exists()) {
		     tarDirFile.mkdir();
		    }
		             
		   MultipartRequest m=new MultipartRequest(request,targetDir,60667377);  
		//   multi = (MultipartHttpServletRequest) request;
		   fileName = m.getOriginalFileName("upload");
		   testid = m.getParameter("testid");
		   System.out.println("testid: " + testid);
		//   fileName = multipartFile.getOriginalFilename();
//		   fileName="Hydrangeas.jpg";
//		   System.out.println(fileName);
//		   System.out.println("hi---- prashant"+m.getOriginalFileName(targetDir));
		  

		  } catch (Exception ex5) {
		   ex5.printStackTrace();
		  
		  }

		  File f = new File(fileName);

		  System.out.println("file path =" + f.getAbsolutePath());

		  try {

		   if (f != null) {
		    fileName = f.getName();
		    System.out.println(fileName);
		    saveFile = targetDir + "/" + testid+fileName; // saving path with
		    System.out.println(saveFile);
		    System.out.println(testid);
		    System.out.println(fileName);
		    FileOutputStream fileOut = null;   
		    fileOut = new FileOutputStream(saveFile);
		    BufferedOutputStream bout = new BufferedOutputStream(fileOut);
		    byte[] b = multipartFile.getBytes();
		    bout.write(b);
		    bout.flush();
		    bout.close();
		    
		   }
		   
		  
		  } catch (Exception ex) {
		   
		  }
		return false;
	}

	public String getContextPathForDirectory(HttpServletRequest request,
			String dirName) {
		HttpSession session = request.getSession(true);
		ServletContext context = session.getServletContext();
		String curDir = context.getRealPath(request.getContextPath());
		curDir = curDir.replaceAll("\\\\", "/");
		String targetDir = curDir.substring(0, curDir.lastIndexOf("/")) + "/"
				+ dirName;
		return targetDir;
	}
	/**
	 * saves temporary file in the correct file path.
	 *
	 * @param path path to save file
	 * @param item file upload item
	 * @return result of saving, true if saved correctly
	 * @throws Exception when error occurs.
	 */
	private boolean saveTemporaryFile(final String path, final FileItem item)
			throws Exception {
		File file = new File(path, this.newFileName);

		AfterFileUploadEventArgs args = new AfterFileUploadEventArgs();
		args.setCurrentFolder(this.currentFolder);
		args.setFile(file);
		args.setFileContent(item.get());
		if (!ImageUtils.isImage(file)) {
			item.write(file);
			if (configuration.getEvents() != null) {
				configuration.getEvents().run(EventTypes.AfterFileUpload,
						args, configuration);
			}
			return true;
		} else if (ImageUtils.checkImageSize(item.getInputStream(), this.configuration)
				|| configuration.checkSizeAfterScaling()) {
			ImageUtils.createTmpThumb(item.getInputStream(), file, getFileItemName(item),
					this.configuration);
			if (!configuration.checkSizeAfterScaling()
					|| FileUtils.checkFileSize(configuration.getTypes().get(this.type), file.length())) {
				if (configuration.getEvents() != null) {
					configuration.getEvents().run(EventTypes.AfterFileUpload, args, configuration);
				}
				return true;
			} else {
				file.delete();
				this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_UPLOADED_TOO_BIG;
				return false;
			}
		} else {
			this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_UPLOADED_TOO_BIG;
			return false;
		}
	}

	/**
	 * if file exists this method adds (number) to file.
	 *
	 * @param path folder
	 * @param name file name
	 * @return new file name.
	 */
	private String getFinalFileName(final String path, final String name) {
		File file = new File(path, name);
		int number = 0;

		String nameWithoutExtension = FileUtils.getFileNameWithoutExtension(name, false);
		Pattern p = Pattern.compile("^(AUX|COM\\d|CLOCK\\$|CON|NUL|PRN|LPT\\d)$", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(nameWithoutExtension);
		boolean protectedName = m.find() ? true : false;

		while (true) {
			if (file.exists() || protectedName) {
				number++;
				StringBuilder sb = new StringBuilder();
				sb.append(FileUtils.getFileNameWithoutExtension(name, false));
				sb.append("(").append(number).append(").");
				sb.append(FileUtils.getFileExtension(name, false));
				this.newFileName = sb.toString();
				file = new File(path, this.newFileName);
				this.errorCode =
						Constants.Errors.CKFINDER_CONNECTOR_ERROR_UPLOADED_FILE_RENAMED;
				protectedName = false;
			} else {
				return this.newFileName;
			}
		}
	}

	/**
	 * validates uploaded file.
	 *
	 * @param item uploaded item.
	 * @param path file path
	 * @return true if validation
	 */
	private boolean validateUploadItem(final FileItem item, final String path) {

		if (item.getName() != null && item.getName().length() > 0) {
			this.fileName = getFileItemName(item);
		} else {
			this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_UPLOADED_INVALID;
			return false;
		}
		this.newFileName = this.fileName;

		for (char c : UNSAFE_FILE_NAME_CHARS) {
			this.newFileName = this.newFileName.replace(c, '_');
		}

		if (configuration.isDisallowUnsafeCharacters()) {
			this.newFileName = this.newFileName.replace(';', '_');
		}
		if (configuration.forceASCII()) {
			this.newFileName = FileUtils.convertToASCII(this.newFileName);
		}
		if (!this.newFileName.equals(this.fileName)) {
			this.errorCode =
					Constants.Errors.CKFINDER_CONNECTOR_ERROR_UPLOADED_INVALID_NAME_RENAMED;
		}


		if (FileUtils.checkIfDirIsHidden(this.currentFolder, configuration)) {
			this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_INVALID_REQUEST;
			return false;
		}
		if (!FileUtils.checkFileName(this.newFileName)
				|| FileUtils.checkIfFileIsHidden(this.newFileName,
				configuration)) {
			this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_INVALID_NAME;
			return false;
		}
		final ResourceType resourceType = configuration.getTypes().get(this.type);
		int checkFileExt = FileUtils.checkFileExtension(this.newFileName, resourceType);
		if (checkFileExt == 1) {
			this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_INVALID_EXTENSION;
			return false;
		}
		if (configuration.ckeckDoubleFileExtensions()) {
			this.newFileName = FileUtils.renameFileWithBadExt(resourceType, this.newFileName);
		}

		try {
			File file = new File(path, getFinalFileName(path, this.newFileName));
			if (!(ImageUtils.isImage(file) && configuration.checkSizeAfterScaling())
					&& !FileUtils.checkFileSize(resourceType, item.getSize())) {
				this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_UPLOADED_TOO_BIG;
				return false;
			}

			if (configuration.getSecureImageUploads() && ImageUtils.isImage(file)
					&& !ImageUtils.checkImageFile(item)) {
				this.errorCode =
						Constants.Errors.CKFINDER_CONNECTOR_ERROR_UPLOADED_CORRUPT;
				return false;
			}

			if (!FileUtils.checkIfFileIsHtmlFile(file.getName(), configuration)
					&& FileUtils.detectHtml(item)) {
				this.errorCode =
						Constants.Errors.CKFINDER_CONNECTOR_ERROR_UPLOADED_WRONG_HTML_FILE;
				return false;
			}
		} catch (SecurityException e) {
			if (configuration.isDebugMode()) {
				this.exception = e;
			}
			this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_ACCESS_DENIED;
			return false;
		} catch (IOException e) {
			if (configuration.isDebugMode()) {
				this.exception = e;
			}
			this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_ACCESS_DENIED;
			return false;
		}


		return true;
	}

	/**
	 * set response headers. Not user in this command.
	 *
	 * @param response response
	 * @param sc servlet context
	 */
	@Override
	public void setResponseHeader(final HttpServletResponse response,
			final ServletContext sc) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
	}

	/**
	 * save if uploaded file item name is full file path not only file name.
	 *
	 * @param item file upload item
	 * @return file name of uploaded item
	 */
	private String getFileItemName(final FileItem item) {
		Pattern p = Pattern.compile("[^\\\\/]+$");
		Matcher m = p.matcher(item.getName());

		return (m.find()) ? m.group(0) : "";
	}

	/**
	 * check request for security issue.
	 *
	 * @param reqParam request param
	 * @return true if validation passed
	 * @throws ConnectorException if valdation error occurs.
	 */
	@Override
	protected boolean checkParam(final String reqParam)
			throws ConnectorException {
		if (reqParam == null || reqParam.equals("")) {
			return true;
		}
		if (Pattern.compile(Constants.INVALID_PATH_REGEX).matcher(reqParam).find()) {
			this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_INVALID_NAME;
			return false;
		}
		return true;
	}

	@Override
	protected boolean checkHidden()
			throws ConnectorException {
		if (FileUtils.checkIfDirIsHidden(this.currentFolder, configuration)) {
			this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_INVALID_REQUEST;
			return true;
		}
		return false;
	}

	@Override
	protected boolean checkConnector(final HttpServletRequest request)
			throws ConnectorException {
		if (!configuration.enabled() || !configuration.checkAuthentication(request)) {
			this.errorCode =
					Constants.Errors.CKFINDER_CONNECTOR_ERROR_CONNECTOR_DISABLED;
			return false;
		}
		return true;
	}

	@Override
	protected boolean checkIfCurrFolderExists(final HttpServletRequest request)
			throws ConnectorException {
		String tmpType = getParameter(request, "type");
		File currDir = new File(configuration.getTypes().get(tmpType).getPath()
				+ this.currentFolder);
		if (currDir.exists() && currDir.isDirectory()) {
			return true;
		} else {
			this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_FOLDER_NOT_FOUND;
			return false;
		}
	}
}
