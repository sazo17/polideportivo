   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	   &     WpfApp1.AgregarFaltaFutbolWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  agregar_falta_futbol��5   	    � Title$ AgregarFaltaFutbolWindow��5   	   $��260.123��6*   $��287.901��6;   ���	#FF343434 � 
ResizeMode$ CanMinimize=�6b    � WindowStyle$
 None=�6{    � WindowStartupLocation$ CenterScreen=�6�   .��5	      � -   5         �Name$ grid_agregar_falta��5	      .+�5
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
   -   5         ��Name$ lbl_agregar_falta��5      $��Agregar Falta��6+   $
��Left=�6C   $��	92,10,0,0q�6^   $	��Top=�6q   ���	#FFFDEFEF$��33��6�   $
 Hand��6�   $	��118��6�   $ 
0.47,1.385&�6�   $
��Bold"�6�   $��14(�6�   $��Center=�6	  $��Center=�6+  �� 5   
   -   5        $ lbl_jugador��5      $��Jugador:��6%   $
��Left=�68   $��	12,56,0,0q�6S   $	��Top=�6f   ���	#FFFDEFEF$��25��6�   $
 Hand��6�   $��58��6�   $ 
0.47,1.385&�6�   �� 5   
   -	   5         ��Name$ cbo_jugador��5      $
��Left=�6(   $��	75,59,0,0q�6C   $	��Top=�6V   $	��186��6n   �� 5   
   -
   5        $ 
lbl_minuto��5      $��Minuto:��6$   $
��Left=�66   $��	12,95,0,0q�6Q   $	��Top=�6d   ���	#FFFDEFEF$��25��6�   $
 Hand��6�   $��58��6�   $ 
0.47,1.385&�6�   �� 5   
   -   5         ��Name$ 
txt_minuto��5      $
��Left=�6&   $��23��6A   $��	75,95,0,0q�6M    �� TextWrapping$
 Wrap=�6`   $��TextBox��6t   $	��Top=�6�   $��27��6�   �� 5   
   -   5        $ lbl_separador_minutos��5      $��:��6/   $
��Left=�6;   $��
109,93,0,0q�6V   $	��Top=�6j   ���	#FFFDEFEF$��25��6�   $
 Hand��6�   $��20��6�   $ 
0.47,1.385&�6�   $
��Bold"�6�   $��14(�6�   �� 5   
   -   5        $ txt_segundos��5      $
��Left=�6(   $��23��6C   $��
129,95,0,0q�6O   $
 Wrap=�6c   $��TextBox��6w   $	��Top=�6�   $��28��6�   $ 1.238,0.894&�6�   �� 5   
   -   5        $ 	lbl_falta��5      $��Falta��6#   $
��Left=�63   $��
20,131,0,0q�6N   $	��Top=�6b   ���	#FFFDEFEF$��25��6�   $
 Hand��6�   $	��241��6�   $ 
0.47,1.385&�6�   $��Center=�6�   $��Center=�6�   �� 5   
   -   5        $	 btn_aceptar��5      $��Aceptar��6&   $
��Left=�68   $��
20,214,0,0q�6S   $	��Top=�6g   $��75��6   �� 5   
   -   5        $	 btn_regresar��5      $��Regresar��6'   $
��Left=�6:   $��100,214,0,0q�6U   $	��Top=�6j   $	��161��6�   6�   �� 5    
   -   5         ��Name$ chk_tarjeta_amarilla��5       $��Tarjeta Amarilla��61   $
��Left=�6L   $��
20,161,0,0q�6g   $	��Top=�6{   ���	#FFF5F2F26�   �� 5!   
   -   5        $ chk_tarjeta_roja��5!      $��Tarjeta Roja��6-   $
��Left=�6D   $��
21,181,0,0q�6_   $	��Top=�6s   ���	#FFF5F2F26�   5#      5$      