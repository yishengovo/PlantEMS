package cn.lingroup.controller;

import cn.lingroup.pojo.FigureLinkPojo;
import cn.lingroup.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/24-15:47
 * @Description:
 */
@Controller
@RequestMapping("/common")
public class CommonController {

    @Autowired
    CommonService commonService;

    @RequestMapping("/overview")
    public String getFigureInfo(@RequestParam("species") String species, Model model) {
        System.out.println(species);
        FigureLinkPojo figureLinkInfo = commonService.getFigureLinkInfo(species);
        model.addAttribute("info", figureLinkInfo);
        return "figurePage/figureLinks";
    }
}
