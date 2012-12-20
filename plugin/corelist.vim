command! -nargs=* Corelist call Corelist(<f-args>)

function Corelist(moduleName)
  let corelist = system('corelist ' . a:moduleName)
  let corelist = corelist[1:-1]
  if !match(corelist, "^a was not in CORE")
    call NotInCore(corelist)
  else
    call InCore(corelist)
  endif
endfunction

function NotInCore(msg)
  echohl WarningMsg
  echo   a:msg
  echohl None
endfunction

function InCore(msg)
  echohl Function
  echo   a:msg
  echohl None
endfunction
