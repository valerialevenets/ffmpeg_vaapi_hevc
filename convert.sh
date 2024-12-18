for i in *.mkv;
  do name=`echo "$i" | rev | cut -d'.' -f2- | rev`
  echo "$name"
  ffmpeg -vaapi_device /dev/dri/renderD128 -i "$i" -vf 'format=nv12,hwupload' -c:v hevc_vaapi -global_quality 22 -preset slow -vtag hvc1 -c:a copy "out/${name}.mkv"
done
