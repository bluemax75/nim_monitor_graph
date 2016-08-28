import cairo

const 
    width = 40
    height = 40
var 
    surf = svg_surface_create("hola.svg", width, height)
    cr = create(surf)

proc doGraphPercentage(cr: PContext, width,height: int, data: openarray[float]) =
    ## Adds lines corresponding to the sequence of percentage values
    
    # TODO how to get surfac size (width and height)
    # let
    #     width = cr.get_target().get_width()
    #     height = cr.get_target.get_height
    var x = 0.0

    echo "Begin ", repr(data), " ", width, " ", height
    cr.move_to(0.0, height.float)
    if data.len < width:
        cr.line_to(width.float - data.len.float, height.float) 
        x = width.float - data.len.float
        echo "line to", x
    for y in data:
        cr.line_to(x, height.float * (1-y))
        echo "x=",x, " y=", height.float * y
        x += 1
    cr.stroke

proc doPercentageBars(cr: PContext, width,height: int, data: openarray[float]) =
    ## Adds Bars corresponding to the sequence of percentage values
    
    # TODO how to get surface size (width and height)
    # let
    #     width = cr.get_target().get_width()
    #     height = cr.get_target.get_height
    cr.set_source_rgba(0.0, 0.0, 0.0, 1.0)
    cr.rectangle(0, 0, width.float, height.float)
    cr.fill()

    cr.set_source_rgba(0.9, 0.0, 0.0, 1.0)
    var x = 0.0

    echo "Begin ", repr(data), " ", width, " ", height
    cr.move_to(0.0, height.float)
    if data.len < width:
        cr.line_to(width.float - data.len.float, height.float) 
        x = width.float - data.len.float
        echo "line to", x
    for y in data:
        x += 1
        cr.move_to(x, height.float)
        cr.line_to(x, height.float * (1-y))
        echo "x=",x, " y=", height.float * y
    cr.stroke

cr.doPercentageBars(40, 20, [0.2, 0, 0.4, 0.5, 0.7, 0.1, 0.1, 0.1, 0.9])

surf.finish
cr.destroy
surf.destroy
