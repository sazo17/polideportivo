   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	   #    WpfApp1.QuitarGolFutbolWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  
quitar_gol��5   	    � Title$ QuitarGolFutbolWindow��5   	   $	��300��6'   $	��300��64   ���	#FF343434 � 
ResizeMode$ CanMinimize=�6W    � WindowStyle$
 None=�6p    � WindowStartupLocation$ CenterScreen=�6�   .��5	      � -   5         �Name$ grid_quitar_goles��5	      .+�5
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
btn_cerrar��5      $�� ��6%   $��10,10,276,0q�60   $	��Top=�6E   $��14��6]   $��0q�6i   $��9(�6�   
 J� IsHitTestVisible
 . $
��Bold"�6  ��5      �� 5      5      �� 5   
   -   5        $	 btn_minimizar��5      $�� ��6(   $
��Left=�63   $��	29,10,0,0q�6N   $	��Top=�6a   $��14��6y   $��14��6�   $��0q�6�   $��9(�6  
 . $
��Bold"�61  $ -0.663,0.471&�6C  $	��Top=�6h  ��5      �� 5      5      �� 5   
   -   5         ��Name$ lbl_quitar_gol��5      $��
Quitar Gol��6(   $
��Left=�6=   $��	90,10,0,0q�6X   $	��Top=�6k   ���	#FFFDEFEF$��33��6�   $
 Hand��6�   $	��118��6�   $ 
0.47,1.385&�6�   $
��Bold"�6�   $��14(�6�   $��Center=�6  $��Center=�6%  �� 5   
   -   5         ��Name$ lst_lista_de_goles��5      $
��Left=�6.   $	��100��6I   $��	73,83,0,0q�6V   $	��Top=�6i   $	��154��6�   .@�5      �� $��
Datos Gol1��6   �� 5      $��
Datos Gol2��6   5      �� 5   
   -	   5        $ lbl_lista_de_goles��5      $��Lista de Goles��6,   $
��Left=�6E   $��	73,51,0,0q�6`   $	��Top=�6s   ���	#FFFDEFEF$��25��6�   $
 Hand��6�   $	��154��6�   $ 
0.47,1.385&�6�   $��Center=�6�   $��Center=�6  �� 5   
   -
   5        $	 btn_modificar��5      $��	Modificar��6(   $
��Left=�6<   $��
73,198,0,0q�6W   $	��Top=�6k   $��75��6�   �� 5   
   -   5        $	 btn_eliminar��5      $��Eliminar��6'   $
��Left=�6:   $��153,198,0,0q�6U   $	��Top=�6j   $��75��6�   �� 5   
   -   5        $	 btn_regresar��5      $��Regresar��6'   $
��Left=�6:   $��
73,223,0,0q�6U   $	��Top=�6i   $	��154��6�   6�   5       5!      