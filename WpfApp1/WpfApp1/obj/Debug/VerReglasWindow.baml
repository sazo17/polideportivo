   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	       WpfApp1.VerReglasWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  reglas��5   	    � Title$ VerReglasWindow��5   	   $	��600��6!   $	��800��6.   ���	#FF343434 � WindowStyle$
 None=�6Q    � 
ResizeMode$ CanMinimize=�6d    � WindowStartupLocation$ CenterScreen=�6}   .��5	      � -   5         �Name$ grid_reglas��5	      .+�5
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
btn_cerrar��5      $�� ��6%   $��10,10,776,0q�60   $	��Top=�6E   $��14��6]   $��0q�6i   $��9(�6�   
 J� IsHitTestVisible
 . $
��Bold"�6  ��5      �� 5      5      �� 5   
   -   5        $	 btn_minimizar��5      $�� ��6(   $
��Left=�63   $��	29,10,0,0q�6N   $	��Top=�6a   $��14��6y   $��14��6�   $��0q�6�   $��9(�6  
 . $
��Bold"�61  $ -0.663,0.471&�6C  $	��Top=�6h  ��5      �� 5      5      �� 5   
   -   5         ��Name$ 
lbl_reglas��5      $��Reglas��6$   $
��Left=�65   $��
281,10,0,0q�6P   $	��Top=�6d   $��65��6|   $	��228��6�   ���	#FFFBF8F8$��36(�6�   $
��Bold"�6�   $��Center=�6�   �� 5   
   -   5        $ lbl_nombre_Copy��5      $��Deporte:��6)   $
��Left=�6<   $��	54,81,0,0q�6W   $	��Top=�6j   ���	#FFFDEFEF$��26��6�   $
 Hand��6�   $��77��6�   $ -1.886,-6.115&�6�   $��Center=�6�   �� 5   
   -	   5         ��Name$ txt_deporte��5      $
��Left=�6'   $��23��6B   $��
131,84,0,0q�6N    �� TextWrapping$
 Wrap=�6b   $	��Top=�6v   $	��120��6�   6�   &   System.Windows.Controls.DataGrid  5   
   -
   5          Name$ dg_mostrar_arbitros��5      $
��Left=�60   $	��232��6K   $��
54,133,0,0q�6X   $	��Top=�6l   $	��366��6�   �� 5   
   -   5        $	 btn_regresar��5      $��Regresar��6'   $
��Left=�6:   $��281,415,0,0q�6U   $	��Top=�6j   $	��461��6�   6�   �� 5   
   -   5        $��	Modificar��5      $
��Left=�6%   $��
54,415,0,0q�6@   $	��Top=�6T   $	��221��6l   6x   5      5      