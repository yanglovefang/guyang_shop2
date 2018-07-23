package com.bw.control;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bw.mapper.ShopMapper;
import com.bw.pojo.Shop;
import com.bw.pojo.Type;
import com.bw.util.FileUtils;
import com.bw.util.PageUtil;

/**
 * 商品控制层
 * 实现了商品添加，批量删除，商品查询功能
 * */
@Controller
public class ShopContorl {
	/**
	 * 注入shopmapper ioc
	 * */
	@Resource
	private ShopMapper shopMapper;
	/**
	 * 商品列表
	 * */
	@RequestMapping("getList")
	public String getList(Model model,PageUtil page,Shop shop) {
		int count = shopMapper.count(shop);
		PageUtil p = new PageUtil(page.getPage(), 5, count);
		Integer a = p.getStartIndex();
		shop.setPage(a.toString());
		shop.setRows(p.getPageSize());
		List<Shop> s = shopMapper.getList(shop);
		model.addAttribute("p", p);
		System.out.println(p.getNextPage());
		model.addAttribute("s", s);
		return "list";
	}
	@RequestMapping("plsc")
	@ResponseBody
	public int plsc(Shop shop) {
		String[] split = shop.getIds().split(",");
		return shopMapper.plsc(split);
	}
	@RequestMapping("save")
	public String save(MultipartFile file,HttpServletRequest request,Shop shop) throws IllegalStateException, IOException {	
		String upload = FileUtils.upload(file, request);
		shop.setUrl("upload/"+upload);
		shopMapper.save(shop);
		return "redirect:getList";
	}
	@RequestMapping("typeList")
	@ResponseBody
	public List<Type> typeList(){
		List<Type> type = shopMapper.typeList();
		return type;
	}
}
