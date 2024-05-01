package cn.lingroup.util.page;

import cn.lingroup.pojo.Page;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/22-20:28
 * @Description:
 */
public class PageUtils {

    public static <T> Page<T> getPage(List<T> list) {
        PageInfo<T> pageInfo = new PageInfo<>(list);
        Page<T> page = new Page<>();
        page.setPageNo(pageInfo.getPageNum());
        page.setItems(list);
        page.setPageTotal(pageInfo.getPages());
        page.setPageTotalCount((int) pageInfo.getTotal());
        return page;
    }
}
