package com.jl3b.touche_nubes;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/error/*")
public class ErrorController {

   public String defaultError() {
      return "error/default";
   }
   
   @RequestMapping("/no_resource")
   public String noResrc() {
      return "error/noResrc";
   }
   
   @RequestMapping("/server_error")
   public String serverError() {
      return "error/serverError";
   }
   
}