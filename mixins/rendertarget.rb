int :x
int :y
has_a :bitmap, :Bitmap
action :update do 
  ` 
     printf("Update Sprite at %d, %d", x, y);
   
  `
end