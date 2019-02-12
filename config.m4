dnl $Id$
dnl config.m4 for extension cppTest

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(cppTest, for cppTest support,
dnl Make sure that the comment is aligned:
dnl [  --with-cppTest             Include cppTest support])

dnl Otherwise use enable:

PHP_ARG_ENABLE(cppTest, whether to enable cppTest support,
Make sure that the comment is aligned:
[  --enable-cppTest           Enable cppTest support])

if test "$PHP_CPPTEST" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-cppTest -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/cppTest.h"  # you most likely want to change this
  dnl if test -r $PHP_CPPTEST/$SEARCH_FOR; then # path given as parameter
  dnl   CPPTEST_DIR=$PHP_CPPTEST
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for cppTest files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       CPPTEST_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$CPPTEST_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the cppTest distribution])
  dnl fi

  dnl # --with-cppTest -> add include path
  dnl PHP_ADD_INCLUDE($CPPTEST_DIR/include)

  dnl # --with-cppTest -> check for lib and symbol presence
  dnl LIBNAME=cppTest # you may want to change this
  dnl LIBSYMBOL=cppTest # you most likely want to change this

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $CPPTEST_DIR/$PHP_LIBDIR, CPPTEST_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_CPPTESTLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong cppTest lib version or lib not found])
  dnl ],[
  dnl   -L$CPPTEST_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(CPPTEST_SHARED_LIBADD)
  PHP_REQUIRE_CXX()
  PHP_SUBST(SEASCLICK_SHARED_LIBADD)
  PHP_ADD_LIBRARY(stdc++, 1, SEASCLICK_SHARED_LIBADD)
  CXXFLAGS="$CXXFLAGS -Wall -Wno-unused-function -Wno-deprecated -Wno-deprecated-declarations -std=c++11"

  PHP_NEW_EXTENSION(cppTest, cppTest.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
fi
