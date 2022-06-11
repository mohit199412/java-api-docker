package com.bbtutorials.echo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EchoController {
	
	@GetMapping("/echo/{name}")
    public String echo(@PathVariable String name) {
	    System.out.println("ARGO CD PIPELINE");
        return "ARGO CD PIPELINE" + name;
    }

}
