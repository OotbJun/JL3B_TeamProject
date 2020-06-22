package com.jl3b.touche_nubes.member.service;

import java.security.MessageDigest;

public class ResiMessageDigest {
	  
   public static String digest(String value) {
      
      String hashCode = null;
      
      try {
          StringBuilder sb = new StringBuilder();
          MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
          messageDigest.reset();
          messageDigest.update((value+"@MGD23%FSC*S$&cjsuvk%wk2!!vkv9").getBytes());
          byte[] chars = messageDigest.digest();
          
          for(int i = 0; i<chars.length; i++) {
             String tmp = Integer.toHexString(chars[i] & 0xff);
             if(tmp.length() ==1) {
                sb.append(0);
             }
          sb.append(tmp);
          }
          hashCode= sb.toString();
          
      }catch(Exception e) {
         e.printStackTrace();
      
      }
    return hashCode ;
  }
}