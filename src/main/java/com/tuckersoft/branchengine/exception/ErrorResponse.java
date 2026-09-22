package com.tuckersoft.branchengine.exception; import java.time.Instant; public record ErrorResponse(String error,String message,Instant timestamp,String path){}
