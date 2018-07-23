package com.bw.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bw.pojo.Shop;
import com.bw.pojo.Type;

/**
 * 商品增删改接口，与数据库交互
 * */
public interface ShopMapper {



	int count(Shop shop);

	List<Shop> getList(Shop shop);

	int plsc(@Param("ids")String[] ids);

	void save(Shop shop);

	List<Type> typeList();

}
