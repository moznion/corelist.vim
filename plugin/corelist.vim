command! -nargs=* Corelist call Corelist(<f-args>)

function Corelist(moduleName)
  let corelist = system('corelist ' . a:moduleName)
  let corelist = corelist[1:-1]
  echo corelist
endfunction
