#define ML_CompileEncode
///ML_CompileEncode(buffer, compile, offset)

var buffer = argument0;
var compile = argument1;
var rpn = ds_queue_create();
ds_queue_copy(rpn, compile[1]);
var offset = argument2;
var s = ds_queue_size(ds);

buffer_seek(buffer, buffer_seek_start, offset);

var type_val;

var val;
repeat (s) {
    val = ds_queue_dequeue(ds);
    if (is_string(val)) {
        type_val = buffer_string;
    } else {
        type_val = buffer_f64;
    }
    
    
    buffer_write(b,buffer_u8, type_val);
    buffer_write(b, type_val, val);

}

buffer_write(b, buffer_u8, $FF);


return buffer_tell(b);
