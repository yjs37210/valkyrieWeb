package kr.valkyrie.ajaxcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

public interface AjaxController {

	public JsonObject requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	
}
