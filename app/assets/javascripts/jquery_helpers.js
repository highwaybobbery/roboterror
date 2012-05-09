function enable_element($element){
  $element.removeAttr('disabled')
}

function disable_element($element){
  $element.attr('disabled', 'disabled')
}

function select_selectors(selectors){
  $s = {}
  for(i in selectors){
    $s[i] = $(selectors[i])
  }
  return $s
}

function test_selectors(selectors, options){
  var defaults = {
    verbose: false
  }
  var settings = $.extend(defaults, options)

    console.log("Begin Selector Tests")
    for(i in selectors){
      if(selectors[i].length == 0){
        console.log("Selector Test Failed: " + i)
      }else{
        if(settings.verbose){
          console.log("Passed: " + i)
        }
      }
    }
}
