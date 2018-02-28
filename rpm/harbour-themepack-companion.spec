# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.27
# 

Name:       harbour-themepack-companion

# >> macros
# << macros

%{!?qtc_qmake:%define qtc_qmake %qmake}
%{!?qtc_qmake5:%define qtc_qmake5 %qmake5}
%{!?qtc_make:%define qtc_make make}
%{?qtc_builddir:%define _builddir %qtc_builddir}
Summary:        Numix Circle icon pack
Version:        0.3.1
Release:        5
Group:          Qt/Qt
License:        GPLv3
Packager:       fravaccaro <fravaccaro@jollacommunity.it>
URL:            https://github.com/fravaccaro/harbour-themepack-companion
Source0:        %{name}-%{version}.tar.bz2
Source100:      harbour-themepack-companion.yaml
Obsoletes:      harbour-iconpack-numix-circle <= 0.0.4-3
Conflicts:      harbour-iconpack-numix-circle
Requires:       sailfish-version >= 2.1.0, harbour-themepacksupport >= 0.0.8-1
BuildRequires:  pkgconfig(sailfishapp) >= 1.0.2
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  desktop-file-utils

%description
Numix Circle icon pack for Sailfish OS.


%prep
%setup -q -n %{name}-%{version}

# >> setup
# << setup

%preun
if [ "$1" = "0" ]; then
    rm -rf /home/nemo/.local/share/harbour-themepack-companion
fi

%build
# >> build pre
# << build pre

%qtc_qmake5 

%qtc_make %{?_smp_mflags}

# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
# << install pre
%qmake5_install

# >> install post
# << install post

desktop-file-install --delete-original       \
  --dir %{buildroot}%{_datadir}/applications             \
   %{buildroot}%{_datadir}/applications/*.desktop

%files
%defattr(-,root,root,-)
%{_bindir}
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
# >> files
# << files

%post
chmod +x /usr/share/%{name}/fetchicons.sh
if [ "$1" = "1" ]; then
    // First installation

fi

%changelog
* Wed Feb 28 2018 0.3.1
- Cover image updated.
- Translations updated.

* Tue Feb 27 2018 0.3.0
- Companion app added.

* Fri Feb 23 2018 0.2.2
- Icons added.

* Tue Nov 28 2017 0.2.1
- Icons added.

* Sun Oct 22 2017 0.2.0
- Icons added.

* Tue Jul 18 2017 0.1.9
- Icons added.

* Tue Jul 4 2017 0.1.8
- Icons added.

* Fri May 26 2017 0.1.7
- Icons added.

* Mon Apr 17 2017 0.1.6
- Icons added.

* Sat Apr 15 2017 0.1.5
- Icons added.

* Fri Mar 31 2017 0.1.4
- Icons added.

* Thu Jan 5 2017 0.1.3
- Icons added.

* Wed Jun 8 2016 0.1.2
- Added icons.
- Added folder icons.

* Sat May 28 2016 0.1.1
- Added icons.

* Wed May 4 2016 0.1.0
- Added icons.
- Rebuilt against Inkscape.

* Wed Apr 27 2016 0.0.9
- Added icons.

* Sat Feb 20 2016 0.0.8
- Added icons.

* Tue Jan 19 2016 0.0.7
- Added icons.
- Added DynClock hires support.

* Tue Jan 12 2016 0.0.6
- Added different resolutions.

* Tue Jan 05 2016 0.0.5
- Themepacksupport compliant.

* Mon Dec 28 2015 0.0.3
- Added icons.

* Mon Dec 28 2015 0.0.3
- Bug fix.

* Sun Dec 27 2015 0.0.1
- First build.
