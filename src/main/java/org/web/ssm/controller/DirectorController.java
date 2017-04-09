package org.web.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/director")
public class DirectorController {

    @RequestMapping("/{url}")
    public String director(@PathVariable("url") String url) {

        return url;
    }
}
