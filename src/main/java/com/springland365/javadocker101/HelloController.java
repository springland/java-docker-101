package com.springland365.javadocker101;

import org.springframework.web.bind.annotation.*;

import java.time.Duration;

@RestController
@RequestMapping("/")
public class HelloController {

    @GetMapping
    public String hello(){
        return "Hello World";
    }


    @PostMapping
    public String hello(@RequestBody  Person person) {

        try {
            Thread.sleep(Duration.ofMinutes(1));
            return String.format(" Hello %s %s", person.firstName, person.lastName);
        }
        catch(Exception ex){
            return ex.getMessage() ;
        }
    }
}
