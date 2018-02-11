﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Layout.Master" AutoEventWireup="true" enableeventvalidation="false" CodeBehind="Content.aspx.cs" Inherits="BoxGroveCleaners.Admin.Content" %>
<asp:content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Administration</title>
    <link href="/Content/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/Content/bootstrap/summernote.css" rel="stylesheet" />
</asp:content>
<asp:content ID="Content2" ContentPlaceHolderID="navigation" runat="server">
    <h1 id="pnlLogoSmall" class="logo-container cf">
        <a data-js-hook="singlepagenav" href="/Default.aspx" title="Go Home" class="logo--small">&nbsp;</a>
    </h1>
    <nav class="nav__container">
        <ul>
            <li class="nav__link">
                <a data-js-hook="singlepagenav" href="/Default.aspx" class="text-contrasting">Home</a>
            </li>
            <li class="nav__link">
                <a data-js-hook="singlepagenav" href="/Pages/Services.aspx" class="text-contrasting">Services</a>
            </li>
            <li class="nav__link nav__link--selected">
                <a data-js-hook="singlepagenav" href="/Pages/CleaningProcess.aspx" class="text-contrasting">Cleaning Process</a>
            </li>
            <li class="nav__link">
                <a data-js-hook="singlepagenav" href="/Pages/LaundryFaqs.aspx" class="text-contrasting">Laundry FAQs</a>
            </li>
            <li class="nav__link">
                <a data-js-hook="singlepagenav" href="/Pages/ContactUs.aspx" class="text-contrasting">Contact Us</a>
            </li>
        </ul>
    </nav>
</asp:content>
<asp:content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form id="pnlAdminForm" runat="server">
        <asp:panel id="pnlLoginForm" cssclass="content" runat="server">
            <h1 class="content__header">
                <span class="content__header__text container-main">
                    Administrator Login
                    <span class="icons--arrowDown">&nbsp;</span>
                </span>
            </h1>
            <section class="content__section--first cf">
                <div class="content__container container-main cf">
                    <div id="pnlLoginContent">
                        <h2 class="content__section__title">
                            Enter Your Credentials
                        </h2>
                        <asp:label id="lblUsername" runat="server" associatedcontrolid="txtUsername" cssclass="label">User name:</asp:label><br />
                        <asp:textbox id="txtUsername" runat="server" cssclass="textbox"></asp:textbox><br />

                        <asp:label id="lblPassword" runat="server" associatedcontrolid="txtPassword" cssclass="label">Password:</asp:label><br />
                        <asp:textbox id="txtPassword" runat="server" cssclass="textbox" textmode="Password"></asp:textbox><br />

                        <asp:label id="lblLoginError" runat="server" cssclass="error-text"></asp:label>
                        <asp:button id="btnLogin" cssclass="btn-main" runat="server" text="Log In" onclick="btnLogin_Click" />
                    </div>
                </div>
            </section>
        </asp:panel>
        <asp:panel id="pnlUploadCoupon" cssclass="content" runat="server" visible="false">
            <h1 class="content__header">
                <span class="content__header__text container-main">
                    Upload Coupon
                    <span class="icons--arrowDown">&nbsp;</span>
                </span>
            </h1>
            <section class="content__section--first cf">
                <div class="content__container container-main cf">
                    <h2 class="content__section__title">
                        Choose a Coupon to Upload
                    </h2>
                    <p>
                        The uploaded coupon must be in .pdf format and will replace the current
                        coupon on the website.
                    </p><br />
                    <asp:fileupload id="upCoupon" runat="server" /><br /><br />
                    <asp:label id="lblCouponError" runat="server" cssclass="error-text"></asp:label>
                    <asp:button id="btnCoupon" cssclass="btn-main" runat="server" text="Save Coupon" onclick="btnCoupon_Click" />
                </div>
            </section>
        </asp:panel>
        <asp:panel id="pnlFAQs" cssclass="content" runat="server" visible="false">
            <h1 class="content__header">
                <span class="content__header__text container-main">
                    Update FAQs
                    <span class="icons--arrowDown">&nbsp;</span>
                </span>
            </h1>
            <section class="content__section--first cf">
                <div id="pnlFAQsList" class="content__container container-main cf">
                    <h2 class="content__section__title">
                        Remove FAQs From List
                    </h2>
                    <asp:repeater id="rptFAQsList" runat="server" onitemcommand="rptFAQsList_ItemCommand">
                        <itemtemplate>
                            <div class="row">
                                <div class="column1">
                                    <asp:hiddenfield id="hiddenKey" runat="server" value='<%#Eval("Key") %>' />
                                    <asp:linkbutton id="btnRemoveFaq" runat="server" commandname="Delete" text="Remove FAQ" cssclass="btn-main"></asp:linkbutton>
                                </div>
                                <div class="column2">
                                    <%#Eval("Question") %>
                                </div>
                            </div>
                        </itemtemplate>
                    </asp:repeater>
                </div>
                <div id="pnlFAQsForm" class="content__container container-main cf">
                    <h2 class="content__section__title">
                        Add New FAQs
                    </h2>
                    <p>
                        When adding new FAQs type into the FAQ field, do not copy and paste from a different program such as Micrsoft Word since
                        such a program will add additional formatting which may not be valid for this website.
                    </p><br />
                    <asp:label id="lblNewQuestion" runat="server" associatedcontrolid="txtNewQuestion" cssclass="label">Question:</asp:label><br />
                    <asp:textbox id="txtNewQuestion" runat="server" cssclass="textbox"></asp:textbox><br /><br />
                    <asp:label id="lblAnswer" runat="server" cssclass="label">Answer:</asp:label><br />
                    <div id="txtAddNewNote"></div>
                    <asp:hiddenfield id="hiddenAnswer" runat="server"></asp:hiddenfield><br />
                    <asp:label id="lblNewFaqError" runat="server" cssclass="error-text"></asp:label>
                    <asp:button id="btnAddFaq" cssclass="btn-main" runat="server" text="Add new FAQ" onclientclick="UpdateHiddenAnswer();" onclick="btnAddFaq_Click" />
                </div>
            </section>
        </asp:panel>
    </form>
    <footer class="footer">
        <div class="content__header__text container-main cf">
            <span class="icons--arrowDownMap">&nbsp;</span>
            <section class="footer__section">
                <h2 class="content__section__title--contrasting">Services</h2>
                <ul class="text-muted">
                    <li>
                        <a data-js-hook="scrollnav" href="/Default.aspx#pnlFineDryCleaning" class="text-muted">
                            Fine Dry Cleaning
                        </a>
                    </li>
                    <li>
                        <a data-js-hook="scrollnav" href="/Default.aspx#pnlShirtLaundering" class="text-muted">
                            Expert Shirt Laundering
                        </a>
                    </li>
                    <li>
                        <a data-js-hook="scrollnav" href="/Default.aspx#pnlProfessionalAlterations" class="text-muted">
                            Professional Alterations
                        </a>
                    </li>
                    <li>
                        <a data-js-hook="scrollnav" href="/Default.aspx#pnlHouseholdTextile" class="text-muted">
                            Household Textile Care
                        </a>
                    </li>
                    <li>
                        <a data-js-hook="scrollnav" href="/Default.aspx#pnlSuedeNLeather" class="text-muted">
                            Suede &amp; Leather Cleaning
                        </a>
                    </li>
                    <li>
                        <a data-js-hook="scrollnav" href="/Default.aspx#pnlWeddingGown" class="text-muted">
                            Wedding Gown Cleaning &amp; Preservation
                        </a>
                    </li>
                </ul>
            </section>
            <section class="footer__section">
                <h2 class="content__section__title--contrasting">Links</h2>
                <ul class="text-muted">
                    <li>
                        <a data-js-hook="singlepagenav" href="/Default.aspx" class="text-muted">
                            Home
                        </a>
                    </li>
                    <li>
                        <a data-js-hook="singlepagenav" href="/Pages/Services.aspx" class="text-muted">
                            Services
                        </a>
                    </li>
                    <li>
                        <a data-js-hook="singlepagenav" href="/Pages/CleaningProcess.aspx" class="text-muted">
                            Cleaning Process
                        </a>
                    </li>
                    <li>
                        <a data-js-hook="singlepagenav" href="/Pages/LaundryFaqs.aspx" class="text-muted">
                            Laundry FAQs
                        </a>
                    </li>
                    <li>
                        <a data-js-hook="singlepagenav" href="/Pages/ContactUs.aspx" class="text-muted">
                            Contact Us
                        </a>
                    </li>
                </ul>
            </section>
            <section class="footer__section">
                <h2 class="content__section__title--contrasting">Affiliation</h2>
                <ul class="text-muted">
                    <li>
                        <a data-js-hook="singlepagenav" href="/Pages/CleaningProcess.aspx" class="text-muted">
                            GreenEarth Cleaning
                        </a>
                    </li>
                </ul>
            </section>
        </div>
    </footer>
</asp:content>
<asp:content ID="Content4" ContentPlaceHolderID="scripts" runat="server">
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/summernote.min.js"></script>
    <script src="/PageScripts/Content.js"></script>
</asp:content>