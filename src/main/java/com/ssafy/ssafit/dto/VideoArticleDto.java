package com.ssafy.ssafit.dto;

public class VideoArticleDto {

    private long videoArticleId;
    private String videoArticleTitle;
    private String videoArticlePart;
    private String videoArticleChannel;
    private String videoArticleUrl;
    private int videoViewCnt;

    public VideoArticleDto(){}

    public VideoArticleDto(long videoArticleId, String videoArticleTitle, String videoArticlePart,
                           String videoArticleChannel, String videoArticleUrl, int videoViewCnt) {
        this.videoArticleId = videoArticleId;
        this.videoArticleTitle = videoArticleTitle;
        this.videoArticlePart = videoArticlePart;
        this.videoArticleChannel = videoArticleChannel;
        this.videoArticleUrl = videoArticleUrl;
        this.videoViewCnt = videoViewCnt;
    }

    public long getVideoArticleId() {
        return videoArticleId;
    }

    public void setVideoArticleId(long videoArticleId) {
        this.videoArticleId = videoArticleId;
    }

    public String getVideoArticleTitle() {
        return videoArticleTitle;
    }

    public void setVideoArticleTitle(String videoArticleTitle) {
        this.videoArticleTitle = videoArticleTitle;
    }

    public String getVideoArticlePart() {
        return videoArticlePart;
    }

    public void setVideoArticlePart(String videoArticlePart) {
        this.videoArticlePart = videoArticlePart;
    }

    public String getVideoArticleChannel() {
        return videoArticleChannel;
    }

    public void setVideoArticleChannel(String videoArticleChannel) {
        this.videoArticleChannel = videoArticleChannel;
    }

    public String getVideoArticleUrl() {
        return videoArticleUrl;
    }

    public void setVideoArticleUrl(String videoArticleUrl) {
        this.videoArticleUrl = videoArticleUrl;
    }

    public int getVideoViewCnt() {
        return videoViewCnt;
    }

    public void setVideoViewCnt(int videoViewCnt) {
        this.videoViewCnt = videoViewCnt;
    }

    @Override
    public String toString() {
        return "VideoArticleDto [videoArticleId=" + videoArticleId + ", videoArticleTitle=" + videoArticleTitle
                + ", videoArticlePart=" + videoArticlePart + ", videoArticleChannel=" + videoArticleChannel
                + ", videoArticleUrl=" + videoArticleUrl + ", videoViewCnt=" + videoViewCnt + "]";
    }
}
