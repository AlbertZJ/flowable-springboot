package com.daffodil.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;

/**
 * 获取地址类
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
public class AddressUtils {
	private static final Logger log = LoggerFactory.getLogger(AddressUtils.class);

	public static final String IP_URL = "http://ip.taobao.com/service/getIpInfo.php";

	public static String getRealAddressByIP(String ip) {
		String address = "127.0.0.1";

		// 内网不查询
		if (IpUtils.internalIp(ip)) {
			return "内网IP";
		}

		String rspStr = HttpUtils.sendPost(IP_URL, "ip=" + ip);
		if (StringUtils.isEmpty(rspStr)) {
			log.error("获取地理位置异常 {}", ip);
			return address;
		}
		try {
			JSONObject json = JSONObject.parseObject(rspStr);
			JSONObject data = json.getJSONObject("data");
			String region = data.getString("region");
			String city = data.getString("city");
			address = region + " " + city;
		} catch (Exception e) {
			log.error("获取地理位置异常 {}", ip);
		}
		return address;
	}
}
