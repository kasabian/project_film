  
  function PodMenu() {
     var is_visibl = false,
         menu;

     
     this.init = function() {
       $("#topnav li").on("mousemove", showPodMenu );

       $("#topnav li").on("mouseleave",hidePodMenu);
     }  

      function hidePodMenu() {

        if (is_visibl) {
        	is_visibl = false;
           menu.fadeOut(300);
        }
      }

      function showPodMenu(el) {
        if (is_visibl == false) {
           menu = $(el.currentTarget).find(".pod_menu");
           is_visibl = true;
           menu.fadeIn(100)
        }


      }  

  
  } 


  $(document).ready(function() {
         var pm = new PodMenu();
         pm.init();
         $('.table-test-odd tr:odd').addClass('odd');
         $('.table-test-odd tr:even').addClass('even');
         

         

     });
