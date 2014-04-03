r = use_args.join(",")
t = use_args
vfunc :marshal_dump do
   v = %{
     RubyValue x(0);
     x.val = rb_ary_new();
     x.call("push", #{r});
     return x.getValue();
   }
   self.`(v)
end

vfunc :marshal_load do |arg|
   v = t.map.with_index{|x, i|
     %{#{x} = arg.call("[]", #{i});}
   }.join("\n")
   self.`(v)
end