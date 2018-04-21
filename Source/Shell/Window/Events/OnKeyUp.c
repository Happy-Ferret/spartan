#include <Kernel.h>
#include <Shell.h>

extern ICanvas *Canvas;

bool OnKeyUp(CWindow *win, CEvent *evt) {
    Logger(" OnKeyUp(%X, %X)\n", win, evt);
    if (!win || !evt) return false;
    bool status = true;

    CCanvas *canvas = win->Canvas;
    CWindow *child = (canvas) ? canvas->Focus   : nullptr;
    CWindow *frame = (canvas) ? canvas->BtmMost : nullptr;

    if (child && child->CallBack) {
        status = child->CallBack(child, evt);
    } else {
        status = win->CallBack(win, evt);
    }
    //Canvas->Redraw(canvas);
    return status;
}