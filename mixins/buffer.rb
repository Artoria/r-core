pointer :data, "void *"

vfunc :alloc do |num|
  `data = reinterpret_cast<void *>(new char[num.cast<int>()]);`
end

vfunc :dispose do
 ` if(data != 0){
     delete [](reinterpret_cast<char *>(data));
    }
    data = 0;
 `
end

vfunc :[] do |*args|
  `if(args.size() == 2){
     return rb_str_new(reinterpret_cast<char *>(data)+(int)args[0], args[1]);
  }`
end

vfunc :[]= do |*args|
  `if(args.size() == 3){
     int a = args[1], b = args[2].call("size");
     int c = a < b ? a : b;
     memcpy(reinterpret_cast<char*>(data) + (int)args[0], (char *)args[2], c);
  }`
end