   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	   %    WpfApp1.OlvideContraseniaWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          �Name$  olvido_contrasenia��5   	    � Title$ OlvideContraseniaWindow��5   	   $	��200��6)   $	��500��66    � 
ResizeMode$ CanMinimize=�6B    � WindowStyle$
 None=�6[   ���	#FF343434.��5	      � -   5         �Name$ grid_olvido_contrasenia��5	      ��5
   
   �� 5      .+�5   
   �� -   5         ��Name$ lbl_contrasenia��5      $��¿Olvidó su Contraseña?��6)   $
��Left=�6J   $��
148,27,0,0q�6e   $	��Top=�6y   $��35��6�   $	��195��6�   ���	#FFFBF8F8$��16(�6�   $
��Bold"�6�   $��Center=�6�   �� 5   
   -   5        $ lbl_mensaje��5      $����Por favor ingrese su correo electronico y nosotros te enviaremos 
          las instrucciones para que reinicies tu contraseña.��6%   $
��Left=�6�   $��
103,64,0,0q�6�   $	��Top=�6�   ���	#FFFDEFEF$��38��6   � Cursor$
 Hand��6"  $	��282��60   J� RenderTransformOrigin$ 
0.47,1.385&�6<  $��9(�6_  z�5      V� 5      .~�5      �� �� 5      �� 5       �� Angle$ 0.157Q�6&   T� 5      5      5      �� 5   
   -   5        	 ��Name$	 	txt_email��5      $
��Left=�6%   $��23��6@   $��100,104,0,0q�6L   
 �� TextWrapping$

 Wrap=�6a   $��Correo Electronico��6u   $	��Top=�6�   $	��285��6�   $��Center=�6�   6�   �� 5   
   -   5         ��Name$ 	btn_email��5      $��Enviar��6$   $
��Left=�65   $��100,139,0,0q�6P   $	��Top=�6e   $	��285��6}   6�   A� 5   
   -   5         A�Name$ ellipse_cerrar��5      ���	#FFE62310$
��Left=�6;   $��14��6V   $��	10,10,0,0q�6b   
���   �$	��Top=�6�   $��14��6�   $ 
1.01,1.058&�6�   $
 Hand��6�   A� 5   
   -   5        $ ellipse_maximizar��5      ���	#FF3FB911$
��Left=�6>   $��14��6Y   $��	29,10,0,0q�6e   
���   �$	��Top=�6�   $��14��6�   $ 
1.01,1.058&�6�   $
 Hand��6�   �� 5   
   -	   5        $ 
btn_cerrar��5      $�� ��6%   $��10,10,476,0q�60   $	��Top=�6E   $��14��6]   $��0q�6i   $��9(�6�    J� IsHitTestVisible . $
��Bold"�6  ��5      �� 5      5       �� 5!   
   -
   5        $ btn_minimizar��5!      $�� ��6(   $
��Left=�63   $��	29,10,0,0q�6N   $	��Top=�6a   $��14��6y   $��14��6�   $��0q�6�   $��9(�6   . $
��Bold"�61  $ -0.663,0.471&�6C  $	��Top=�6h  ��5"      �� 5#      5%      5'      5(      