# Video_Downloader

1-To run the login script as root and do a

              git clone https://github.com/mohamedwassim817/Video_Downloader.git

In the desktop and run this docker command which will automatically download the audio and put it in     
 /root/Desktop/youtube_download/download_container

2- docker: 
   
   -build image 
  
     docker build -t video-download:latest .
   
   -run the image  
   
     docker run -it -v /root/Desktop/youtube_download/download_container:/data --name video video-download:latest
