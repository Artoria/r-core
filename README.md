r-core
======

use ruby to write core logic to cpp applications


Usage
-----


Shell
-----

```shell
ruby rmk r-core init Artoria MyApp
```

generates an MyApp directory and its hierachy as well as a github repo Artoria/MyApp


```shell
ruby rmk r-core build
```

generates output\main.cpp and other cpp you specified



```shell
ruby rmk r-core compile main.cpp -o main.exe
```

switch to 'output' directory and compiles main.cpp , *compile* command only gives -I and -L arguments to gcc. 
The -I and -L data comes from :hostruby in config.yml, currently you must set it manually.


Script and conventions
-------------------------
for example:

```ruby
  class Sprite < RGSS::GameClass
     flag :visible               # bool visible;   with "visible=" and "visible" defined in client Ruby
     has_a :src_rect, :Rect      # VALUE src_rect; with "src_rect(=)" defined in client Ruby, and src_rect gives a Ruby Object
     use :RenderTarget           # mix in  "mixins/rendertarget.rb"
  end
  
  
#and in mixins/rendertarget.rb
  int   :x
  int   :y
  has_a :texture, :Texture
  action :update do 
  # you may need to insert C++ code directly as a mixin plugin provider, use a backtick
  `  
     printf("Update at %d, %d, %d", x, y, RubyValue(texture).call("texid"));
   
  `
  end
```
