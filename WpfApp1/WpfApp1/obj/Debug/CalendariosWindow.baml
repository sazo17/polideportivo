   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	       WpfApp1.CalendariosWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  
calendario��5   	    � Title$ CalendariosWindow��5   	   $	��600��6#   $	��800��60    � WindowStyle$
 None=�6<    � 
ResizeMode$ CanMinimize=�6O   ���	#FF343434 � WindowStartupLocation$ CenterScreen=�6   .��5	      � -   5         �Name$ grid_calendario��5	      .+�5
   
   &   System.Windows.Controls.Calendar  -   5          Name$ cal_calendario��5
      $
��Left=�6+   $��312,158,0,0q�6F   $	��Top=�6[   �� 5   
   -   5         ��Name$ lbl_seleccionar_deporte��5      $��Seleccionar deporte:��61   $
��Left=�6P   $��151,105,0,0q�6k   $	��Top=�6�   ���	#FFFDFBFB$	��149��6�   �� 5   
   -   5         ��Name$ cbo_deporte��5      $
��Left=�6(   $��274,109,0,0q�6C   $	��Top=�6X   $	��120��6p   �� 5   
   -   5        $ 
lbl_equipo��5      $��Equipo:��6$   $
��Left=�66   $��410,105,0,0q�6Q   $	��Top=�6f   ���	#FFFDFBFB$��50��6�   	 J� RenderTransformOrigin$	 	0.7,0.615&�6�   �� 5   
   -   5        $ 
cbo_equipo��5      $
��Left=�6'   $��465,109,0,0q�6B   $	��Top=�6W   $	��120��6o   �� 5   
   -   5        
 ��Name$
 
btn_buscar��5      $��>��6%   $
��Left=�64   $��608,109,0,0q�6O   $	��Top=�6d   $��25��6|   $��20��6�   $	 -7.72,0&�6�   6�   �� 5   
   -	   5        $ lbl_calendario��5      $��Calendario
��6(   $
��Left=�6G   $��
256,44,0,0q�6b   $	��Top=�6v   $��42��6�   $	��287��6�   ���	#FFFBF8F8$��24(�6�   $
��Bold"�6�   $��Center=�6�   A� 5   
   -
   5         A�Name$ ellipse_cerrar��5      ���	#FFE62310$
��Left=�6;   $��14��6V   $��	10,10,0,0q�6b   
���   �$	��Top=�6�   $��14��6�   $	 
1.01,1.058&�6�    � Cursor$
 Hand��6�   A� 5   
   -   5        $ ellipse_maximizar��5      ���	#FF3FB911$
��Left=�6>   $��14��6Y   $��	29,10,0,0q�6e   
���   �$	��Top=�6�   $��14��6�   $	 
1.01,1.058&�6�   $
 Hand��6�   �� 5   
   -   5        $
 
btn_cerrar��5      $�� ��6%   $��10,10,776,0q�60   $	��Top=�6E   $��14��6]   $��0q�6i   $��9(�6�    J� IsHitTestVisible . $
��Bold"�6  ��5      �� 5      5      �� 5   
   -   5        $
 btn_minimizar��5      $�� ��6(   $
��Left=�63   $��	29,10,0,0q�6N   $	��Top=�6a   $��14��6y   $��14��6�   $��0q�6�   $��9(�6   . $
��Bold"�61  $	 -0.663,0.471&�6C  $	��Top=�6h  ��5      �� 5      5      �� 5   
   -   5        $
 btn_regresar��5      $��Regresar��6'   $
��Left=�6:   $��312,351,0,0q�6U   $	��Top=�6j   $	��179��6�   6�   5      5       