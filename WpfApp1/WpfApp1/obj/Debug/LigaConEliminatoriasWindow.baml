   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	   (    "WpfApp1.LigaConEliminatoriasWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  liga_con_eliminatorias��5   	    � Title$  LigaConEliminatoriasWindow��5   	   $	��600��6,   $	��800��69   ���	#FF343434 � 
ResizeMode$ CanMinimize=�6\    � WindowStyle$
 None=�6u    � WindowStartupLocation$ CenterScreen=�6�   .��5	      � -   5         �Name$! grid_liga_con_eliminatorias��5	      .+�5
   
   �� -   5         ��Name$  lbl_liga_con_eliminatorias��5
      $��Liga con Eliminatorias��64   $
��Left=�6U   $��
216,20,0,0q�6p   $	��Top=�6�   $��65��6�   $	��396��6�   ���	#FFFBF8F8$��36(�6�   $
��Bold"�6�   $��Center=�6�   �� 5   
   -   5         ��Name$  btn_liga_con_eliminatorias��5      $�� ��65   $
��Left=�6@   $��327,149,0,0q�6[   $	��Top=�6p   $	��158��6�   $	��160��6�   $��0q�6�   ��5      �� 5       �� ImageSource$< 6polideportivo_images/campeonatos/ligaeliminatorias.png��6   5      �� 5   
   -   5        $ lbl_numero_equipos��5      $��Número de equipos:��6,   $
��Left=�6I   $��276,359,0,0q�6d   $	��Top=�6y   ���	#FFFDEFEF$��26��6�   	 � Cursor$
	 Hand��6�   $	��118��6�   $��Center=�6�   
 J� RenderTransformOrigin$
 
0.47,1.385&�6�   �� 5   
   -   5         ��Name$ txt_numero_equipos��5      $
��Left=�6.   $��23��6I   $��490,359,0,0q�6U    �� TextWrapping$
 Wrap=�6j   $��10��6~   $	��Top=�6�   $��50��6�   �� 5   
   -   5        $ lbl_partidos_ida_vuelta��5      $0��*Partidos de ida y vuelta en eliminatorias:��61   $
��Left=�6f   $��276,385,0,0q�6�   $	��Top=�6�   ���	#FFFDEFEF$��26��6�   $
	 Hand��6�   $	��135��6�   $��Center=�6�   $
 
0.47,1.385&�6  �� 5   
   -   5        $ btn_cancelar��5      $��Cancelar��6'   $
��Left=�6:   $��276,460,0,0q�6U   $	��Top=�6j   $	��261��6�   $��26��6�   6�   	� 5   
   -	   5         	�Name$ rdb_si��5      $	��Sí��6&   $
��Left=�63   $��417,391,0,0q�6N   $	��Top=�6c   ���	#FFFBFAFA6{   	� 5   
   -
   5        $ rdb_no��5      $��No��6&   $
��Left=�63   $��461,391,0,0q�6N   $	��Top=�6c   ���	#FFFBFAFA$
 1.286,0.467&�6�   �� 5   
   -   5        $ lbl_nombre_liga��5      $��Nombre de liga:��6)   $
��Left=�6C   $��276,328,0,0q�6^   $	��Top=�6s   ���	#FFFDEFEF$��26��6�   $
	 Hand��6�   $��97��6�   $��Center=�6�   $
 
0.47,1.385&�6�   z�5      V� 5      .~�5      �� �� 5      �� 5       �� Angle$ -1Q�6&   T� 5      5      5      �� 5    
   -   5        $ txt_nombre_liga��5       $
��Left=�6+   $��23��6F   $��415,328,0,0q�6R   $
 Wrap=�6g   $��TextBox��6{   $	��Top=�6�   $	��125��6�   �� 5!   
   -   5        $ btn_nueva_liga��5!      $"��Nueva liga con eliminatorias��6)   $
��Left=�6P   $��276,429,0,0q�6k   $	��Top=�6�   $	��261��6�   $��26��6�   6�   �� 5"   
   -   5        $ 
btn_restar��5"      $��<��6%   $
��Left=�64   $��415,359,0,0q�6O   $	��Top=�6d   $��33��6|   $��23��6�   �� 5#   
   -   5        $ 	btn_sumar��5#      $��>��6$   $
��Left=�63   $��452,359,0,0q�6N   $	��Top=�6c   $��33��6{   $��23��6�   A� 5$   
   -   5         A�Name$ ellipse_cerrar��5$      ���	#FFE62310$
��Left=�6;   $��14��6V   $��	10,10,0,0q�6b   
���   �$	��Top=�6�   $��14��6�   $
 
1.01,1.058&�6�   $
	 Hand��6�   A� 5%   
   -   5        $ ellipse_maximizar��5%      ���	#FF3FB911$
��Left=�6>   $��14��6Y   $��	29,10,0,0q�6e   
���   �$	��Top=�6�   $��14��6�   $
 
1.01,1.058&�6�   $
	 Hand��6�   �� 5&   
   -   5        $ 
btn_cerrar��5&      $�� ��6%   $��10,10,776,0q�60   $	��Top=�6E   $��14��6]   $��0q�6i   $��9(�6�    J� IsHitTestVisible . $
��Bold"�6  ��5'      �� 5(      5*      �� 5+   
   -   5        $ btn_minimizar��5+      $�� ��6(   $
��Left=�63   $��	29,10,0,0q�6N   $	��Top=�6a   $��14��6y   $��14��6�   $��0q�6�   $��9(�6   . $
��Bold"�61  $
 -0.663,0.471&�6C  $	��Top=�6h  ��5,      �� 5-      5/      51      52      