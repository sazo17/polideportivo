﻿#pragma checksum "..\..\CalendariosWindow.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "6026F6DA0CEAF4173E55A16C90FF4086575C9522"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using WpfApp1;


namespace WpfApp1 {
    
    
    /// <summary>
    /// CalendariosWindow
    /// </summary>
    public partial class CalendariosWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 11 "..\..\CalendariosWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lbl_seleccionar_deporte;
        
        #line default
        #line hidden
        
        
        #line 12 "..\..\CalendariosWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cmbx_deporte;
        
        #line default
        #line hidden
        
        
        #line 13 "..\..\CalendariosWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lbl_equipo;
        
        #line default
        #line hidden
        
        
        #line 14 "..\..\CalendariosWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cmbx_equipo;
        
        #line default
        #line hidden
        
        
        #line 15 "..\..\CalendariosWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btn_buscar;
        
        #line default
        #line hidden
        
        
        #line 16 "..\..\CalendariosWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lbl_calendario;
        
        #line default
        #line hidden
        
        
        #line 17 "..\..\CalendariosWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Shapes.Ellipse ellipse_cerrar;
        
        #line default
        #line hidden
        
        
        #line 18 "..\..\CalendariosWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Shapes.Ellipse ellipse_maximizar;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\CalendariosWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btn_cerrar;
        
        #line default
        #line hidden
        
        
        #line 24 "..\..\CalendariosWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btn_minimizar;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/WpfApp1;component/calendarioswindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\CalendariosWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.lbl_seleccionar_deporte = ((System.Windows.Controls.Label)(target));
            return;
            case 2:
            this.cmbx_deporte = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 3:
            this.lbl_equipo = ((System.Windows.Controls.Label)(target));
            return;
            case 4:
            this.cmbx_equipo = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 5:
            this.btn_buscar = ((System.Windows.Controls.Button)(target));
            
            #line 15 "..\..\CalendariosWindow.xaml"
            this.btn_buscar.Click += new System.Windows.RoutedEventHandler(this.btn_buscar_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.lbl_calendario = ((System.Windows.Controls.Label)(target));
            return;
            case 7:
            this.ellipse_cerrar = ((System.Windows.Shapes.Ellipse)(target));
            return;
            case 8:
            this.ellipse_maximizar = ((System.Windows.Shapes.Ellipse)(target));
            return;
            case 9:
            this.btn_cerrar = ((System.Windows.Controls.Button)(target));
            
            #line 19 "..\..\CalendariosWindow.xaml"
            this.btn_cerrar.Click += new System.Windows.RoutedEventHandler(this.btn_cerrar_Click);
            
            #line default
            #line hidden
            
            #line 19 "..\..\CalendariosWindow.xaml"
            this.btn_cerrar.MouseEnter += new System.Windows.Input.MouseEventHandler(this.btn_cerrar_MouseEnter);
            
            #line default
            #line hidden
            
            #line 19 "..\..\CalendariosWindow.xaml"
            this.btn_cerrar.MouseLeave += new System.Windows.Input.MouseEventHandler(this.btn_cerrar_MouseLeave);
            
            #line default
            #line hidden
            return;
            case 10:
            this.btn_minimizar = ((System.Windows.Controls.Button)(target));
            
            #line 24 "..\..\CalendariosWindow.xaml"
            this.btn_minimizar.Click += new System.Windows.RoutedEventHandler(this.btn_minimizar_Click);
            
            #line default
            #line hidden
            
            #line 24 "..\..\CalendariosWindow.xaml"
            this.btn_minimizar.MouseEnter += new System.Windows.Input.MouseEventHandler(this.btn_minimizar_MouseEnter);
            
            #line default
            #line hidden
            
            #line 24 "..\..\CalendariosWindow.xaml"
            this.btn_minimizar.MouseLeave += new System.Windows.Input.MouseEventHandler(this.btn_minimizar_MouseLeave);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

