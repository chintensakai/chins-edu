package org.chins.edu.service.video.service.impl;

import com.aliyun.oss.ClientException;
import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.UploadVideoRequest;
import com.aliyun.vod.upload.resp.UploadVideoResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.aliyuncs.vod.model.v20170321.DeleteVideoResponse;
import java.io.File;
import java.io.IOException;
import org.chins.edu.service.video.service.IVideoService;
import org.chins.edu.service.video.utils.VodConstantUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class VideoServiceImpl implements IVideoService {

  public static DefaultAcsClient initVodClient(String accessKeyId, String accessKeySecret)
      throws ClientException {
    String regionId = "cn-shanghai";  // 点播服务接入区域
    DefaultProfile profile = DefaultProfile.getProfile(regionId, accessKeyId, accessKeySecret);
    DefaultAcsClient client = new DefaultAcsClient(profile);
    return client;
  }

  private static DeleteVideoResponse deleteVideo(DefaultAcsClient client, String videoId)
      throws Exception {
    DeleteVideoRequest request = new DeleteVideoRequest();
    //支持传入多个视频ID，多个用逗号分隔
    request.setVideoIds(videoId);
    return client.getAcsResponse(request);
  }

  @Override
  public String uploadVideoToOss(MultipartFile file) {

    String filename = file.getOriginalFilename();
    String title = filename.substring(0, filename.lastIndexOf("."));
    File dest = new File(System.getProperty("user.dir") + "/" + filename);
    try {
      file.transferTo(dest);
    } catch (IOException e) {
      e.printStackTrace();
    }
    System.out.println(dest.getAbsolutePath());
    UploadVideoRequest request = new UploadVideoRequest(VodConstantUtils.KEY_ID,
        VodConstantUtils.KEY_SECRET, title,
        dest.getAbsolutePath());
    /*可指定分片上传时每个分片的大小，默认为1M字节*/
    request.setPartSize(5 * 1024 * 1024L);
    /*可指定分片上传时的并发线程数，默认为1（注：该配置会占用服务器CPU资源，需根据服务器情况指定）*/
    request.setTaskNum(1);
        /*是否开启断点续传，默认断点续传功能关闭。当网络不稳定或者程序崩溃时，再次发起相同上传请求，可以继续未完成的上传任务，适用于超时3000秒仍不能上传完成的大文件。
        注意: 断点续传开启后，会在上传过程中将上传位置写入本地磁盘文件，影响文件上传速度，请您根据实际情况选择是否开启*/
    request.setEnableCheckpoint(false);

    UploadVideoImpl uploader = new UploadVideoImpl();
    UploadVideoResponse response = uploader.uploadVideo(request);
    System.out.print("RequestId=" + response.getRequestId() + "\n");  //请求视频点播服务的请求ID
    if (response.isSuccess()) {
      System.out.print("VideoId=" + response.getVideoId() + "\n");
    } else {
      /* 如果设置回调URL无效，不影响视频上传，可以返回VideoId同时会返回错误码。其他情况上传失败时，VideoId为空，此时需要根据返回错误码分析具体错误原因 */
      System.out.print("VideoId=" + response.getVideoId() + "\n");
      System.out.print("ErrorCode=" + response.getCode() + "\n");
      System.out.print("ErrorMessage=" + response.getMessage() + "\n");
    }

    return response.getVideoId();
  }

  @Override
  public void removeVideoById(String videoId) {
    DefaultAcsClient client = initVodClient(VodConstantUtils.KEY_ID,
        VodConstantUtils.KEY_SECRET);

    DeleteVideoResponse response = new DeleteVideoResponse();
    try {
      response = deleteVideo(client, videoId);
    } catch (Exception e) {
      System.out.print("ErrorMessage = " + e.getLocalizedMessage());
    }
    System.out.print("RequestId = " + response.getRequestId() + "\n");
  }
}
