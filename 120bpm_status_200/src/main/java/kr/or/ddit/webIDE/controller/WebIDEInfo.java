package kr.or.ddit.webIDE.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("project/webide")
public class WebIDEInfo {

	@RequestMapping("git")
	public String selectGitInfo() {
		return null;
	}
	
	@RequestMapping("svn")
	public String selectSVNInfo() {
		return null;
	}
}
