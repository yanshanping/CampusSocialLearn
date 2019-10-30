package com.social.framework.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.social.project.system.config.service.IConfigService;

/**
 * social首创 html调用 thymeleaf 实现参数管理
 * 
* @author yanggang
 */
@Service("config")
public class ConfigService
{
    @Autowired
    private IConfigService configService;

    /**
     * 根据键名查询参数配置信息
     * 
     * @param configName 参数名称
     * @return 参数键值
     */
    public String getKey(String configKey)
    {
        return configService.selectConfigByKey(configKey);
    }

}
