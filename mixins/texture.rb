use :Buffer
type :texid, "GLuint"
int :width
int :height


vfunc :setup_texture do |*args|
 `
    if(args.size() == 2){
      instance_alloc(RubyValue((int)args[0] * (int)args[1] * 4).getValue());
      width    = args[0];
      height   = args[1];
/*
      glGenTextures(1, &texid);
      glBindTexture(GL_TEXTURE_2D, texid);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
      glTexImage2D(GL_TEXTURE_2D, 0 , GL_BGRA, width, height, 0, GL_BGRA, GL_UNSIGNED_BYTE, data);
*/
    }else{

    }
 `
end



