/* ************************************************************************** */
/* author(s) : Michael Collins                                                */
/* file name : library/libk.c                                                 */
/* file date : 2017/12/03                                                     */
/* file info : kernel end points for c standard library                       */
/* ************************************************************************** */
#include <arch.h>
#include <boot.h>
#include <libk.h>

_declspec(dllexport)
char *realloc(void) { return "force relocations"; }

int _stdcall main(int magic, uint32_t *info[], MBHDR *mbhdr) {
    return 1;
}