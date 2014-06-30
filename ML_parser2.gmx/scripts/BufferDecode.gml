///BufferDecode(buffer, offset)

/*//

[type][data][type][data][end]


(buffer_u8); //1
(buffer_u16); //3
(buffer_u32); //5
(buffer_s8); //2
(buffer_s16); //4
(buffer_s32); //6
(buffer_f16); //7
(buffer_f32); //8
(buffer_f64); //9
(buffer_bool); //10
(buffer_string); //11

(ds_type_grid); //5 +128 = 133
(ds_type_list); //2 +128 = 130
(ds_type_map); //1 +128 = 129
(ds_type_priority); //6 +128 = 134 
(ds_type_queue); //4 +128 =132
(ds_type_stack); //3 +128 = 131

u16-in-list-in-list example:

[130][130][3][X][X][3][X][X][3][X][X][255][129][3][X][X][130][4][X][X][4][X][X][255][1][X][130][8][X][X][X][X][255][255][255]

//*/
var b = argument0;
var offset = argument1;
buffer_seek(b, buffer_seek_start, offset);
var type = buffer_read(b, buffer_u8);
var tret = _ML_BD_GetData(b, type);
return tret[0];
