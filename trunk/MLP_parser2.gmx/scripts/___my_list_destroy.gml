///ds_list_destroy(a)

var li = argument0;

if (li = 0) {
    show_error("bad list destroy", false);
}

--global.ACTIVELISTS;
ds_list_destroy(li)
