<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Clinical.Index" %>
<!DOCTYPE HTML>
<!--
    Phantom by HTML5 UP
    html5up.net | @ajlkn
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
    <head>
        <title>clinical | Sistemas en L&iacute;nea para Control su M&eacute;dico |</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>
        <!-- Wrapper -->
            <div id="wrapper">

                <!-- Header -->
                    <header id="header">
                        <div class="inner">
                            <!-- Logo -->
                                <a href="Index.aspx" class="logo">
                                    <span class="symbol"><img src="/images/logo.png" alt="" /></span><span class="title"></span>
                                </a>

                            <!-- Nav -->
                                <nav>
                                    <ul>
                                        <li><a href="#menu">Menu</a></li>
                                    </ul>
                                </nav>
                        </div>
                    </header>

                <!-- Menu -->
                    <nav id="menu">
                        <h2>Menu</h2>
                        <ul>
                            <li><a href="Index.aspx">Home</a></li>
                            <li><a href="../Vista/Cita.aspx">Citas </a></li>
                            <li><a href="../Vista/Login.aspx">Entrar al sistema (M&eacute;dicos afiliados)</a></li>
                        </ul>
                    </nav>

                <!-- Main -->
                    <div id="main">
                        <div class="inner">
                            <header>
                                <h4><!--[-->Bienvenido, estamos para ayudarle con sus necesidades m&eacute;dicas mas urgentes<!--]--><br />
                                </h4>
                            </header>
                            <section class="tiles">
                                <article class="style1">
                                    <span class="image">
                                        <img src="images/pic03.jpg" alt="" />
                                    </span>
                                    <a href="../Vista/Cita.aspx">
                                        <h2>Citas</h2>
                                        <div class="content">
                                            <p>Haga clic en la imagen para agendar su cita.</p>
                                        </div>
                                        </a>
                                </article>
                                <article class="style2">
                                    <span class="image">
                                        <img src="images/pic02.jpg" alt="" />
                                    </span>
                                    <a href="generic.html">
                                        <h2>M&eacute;dicos</h2>
                                        <div class="content">
                                            <p>Consulte la lista de los doctores que trabajan con nosotros.</p>
                                        </div>
                                    </a>
                                </article>
                                <article class="style3">
                                    <span class="image">
                                        <img src="images/pic01.jpg" alt="" />
                                    </span>
                                    <a href="generic.html">
                                        <h2>Clinicas</h2>
                                        <div class="content">
                                            <p>Contamos con una amplia selcci&oacute;n de las mejores clinicas privadas su disposici&oacute;n.</p>
                                        </div>
                                    </a>
                                </article>

                            </section>
                        </div>
                    </div>

                <!-- Footer -->
                    <footer id="footer">
                        <div class="inner">

                            <section>
                                <h2>Siganos</h2>
                                <ul class="icons">
                                    <li><a href="#" class="icon style2 fa-twitter"><span class="label">Twitter</span></a></li>
                                    <li><a href="#" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>
                                    <li><a href="#" class="icon style2 fa-instagram"><span class="label">Instagram</span></a></li>
                                </ul>
                            </section>
                            <ul class="copyright">
                                <li>&copy; CarcebSistemas. Todos los derechos reservados</li>
                            </ul>
                        </div>
                    </footer>

            </div>

        <!-- Scripts -->
            <script src="assets/js/jquery.min.js"></script>
            <script src="assets/js/skel.min.js"></script>
            <script src="assets/js/util.js"></script>
            <script src="assets/js/main.js"></script>

    </body>
</html>