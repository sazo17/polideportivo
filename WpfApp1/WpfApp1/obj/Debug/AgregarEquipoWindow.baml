   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	   !    WpfApp1.AgregarEquipoWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  agregar_equipo��5   	    � Title$ AgregarEquipoWindow��5   	   $	��289��6%   $	��658��62   ���	#FF343434 � WindowStyle$
 None=�6U    � 
ResizeMode$ CanMinimize=�6h    � WindowStartupLocation$ CenterScreen=�6�   .��5	      � -   5         �Name$ grid_agregar_equipo��5	      .+�5
   
   A� -   5         A�Name$ ellipse_cerrar��5
      ���	#FFE62310$
��Left=�6;   $��14��6V   $��	10,10,0,0q�6b   
���   �$	��Top=�6�   $��14��6�    J� RenderTransformOrigin$ 
1.01,1.058&�6�    � Cursor$
 Hand��6�   A� 5   
   -   5        $ ellipse_maximizar��5      ���	#FF3FB911$
��Left=�6>   $��14��6Y   $��	29,10,0,0q�6e   
���   �$	��Top=�6�   $��14��6�   $ 
1.01,1.058&�6�   $
 Hand��6�   �� 5   
   -   5        	 ��Name$	 
btn_cerrar��5      $�� ��6%   $��10,10,781,0q�60   $	��Top=�6E   $��14��6]   $��0q�6i   $��9(�6�   
 J� IsHitTestVisible
 . $
��Bold"�6  ��5      �� 5      5      �� 5   
   -   5        $	 btn_minimizar��5      $�� ��6(   $
��Left=�63   $��	29,10,0,0q�6N   $	��Top=�6a   $��14��6y   $��14��6�   $��0q�6�   $��9(�6  
 . $
��Bold"�61  $ -0.663,0.471&�6C  $	��Top=�6h  ��5      �� 5      5      �� 5   
   -   5         ��Name$ 
lbl_nombre��5      $��Nombre:��6$   $
��Left=�66   $��
70,103,0,0q�6Q   $	��Top=�6e   ���	#FFFDEFEF$��26��6�   $
 Hand��6�   $��66��6�   $ -1.886,-6.115&�6�   $��Center=�6�   �� 5   
   -   5         ��Name$ 
txt_nombre��5      $
��Left=�6&   $��23��6A   $��189,107,0,0q�6M    �� TextWrapping$
 Wrap=�6b   $	��Top=�6v   $	��154��6�   �� 5   
   -	   5        $ lbl_entrenador��5      $��Entrenador:��6(   $
��Left=�6>   $��353,104,0,0q�6Y   $	��Top=�6n   ���	#FFFDEFEF$��26��6�   $
 Hand��6�   $��77��6�   $ -1.886,-6.115&�6�   $��Center=�6�   �� 5   
   -
   5        $ 
lbl_equipo��5      $��Equipo��6$   $
��Left=�65   $��
250,10,0,0q�6P   $	��Top=�6d   $��65��6|   $	��159��6�   ���	#FFFBF8F8$��36(�6�   $
��Bold"�6�   $��Center=�6�   �� 5   
   -   5        $	 btn_regresar��5      $��Regresar��6'   $
��Left=�6:   $��348,233,0,0q�6U   $	��Top=�6j   $	��241��6�   $��19��6�   $ 0.53,-0.053&�6�   6�   �� 5   
   -   5        $	 btn_guardar��5      $��Guardar��6&   $
��Left=�68   $��
70,233,0,0q�6S   $	��Top=�6g   $	��273��6   $��19��6�   6�   �� 5   
   -   5        $ lbl_cantidad_jugadores��5      $��Cantidad Jugadores:��60   $
��Left=�6N   $��
70,131,0,0q�6i   $	��Top=�6}   ���	#FFFDEFEF$��26��6�   $
 Hand��6�   $	��114��6�   $ -1.886,-6.115&�6�   $��Center=�6�   �� 5   
   -   5        $ txt_cantidad_jugadores��5      $
��Left=�62   $��23��6M   $��189,135,0,0q�6Y   $
 Wrap=�6n   $	��Top=�6�   $	��154��6�   �� 5   
   -   5        $ lbl_color_uniforme_local��5      $��Uniforme��62   $
��Left=�6E   $��
70,162,0,0q�6`   $	��Top=�6t   ���	#FFFDEFEF$��26��6�   $
 Hand��6�   $	��101��6�   $ -1.886,-6.115&�6�   $��Center=�6�   �� 5   
   -   5         ��Name$ cbo_color_uniforme_local��5      $
��Left=�65   $��189,166,0,0q�6P   $	��Top=�6e   $	��154��6}   �� 5    
   -   5        $ cbo_entrenador��5       $
��Left=�6+   $��448,108,0,0q�6F   $	��Top=�6[   $	��154��6s   5"      5#      