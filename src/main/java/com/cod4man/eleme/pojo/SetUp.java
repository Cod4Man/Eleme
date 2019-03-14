package com.cod4man.eleme.pojo;

/** 图片目录地址
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-03-11
 * Time:16:04
 */
public class SetUp {
    private String images_consumer; //买家图片
    private String images_logo; //网站Logo
    private String images_restaurant_picture; //店铺图片

    public String getImages_consumer() {
        return images_consumer;
    }

    public void setImages_consumer(String images_consumer) {
        this.images_consumer = images_consumer;
    }

    public String getImages_logo() {
        return images_logo;
    }

    public void setImages_logo(String images_logo) {
        this.images_logo = images_logo;
    }

    public String getImages_restaurant_picture() {
        return images_restaurant_picture;
    }

    public void setImages_restaurant_picture(String images_restaurant_picture) {
        this.images_restaurant_picture = images_restaurant_picture;
    }

    @Override
    public String toString() {
        return "SetUp{" + "images_consumer='" + images_consumer + '\'' + ", images_logo='" + images_logo + '\'' + ", images_restaurant_picture='" + images_restaurant_picture + '\'' + '}';
    }
}
