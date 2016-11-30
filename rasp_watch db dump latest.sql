-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Nov 2016 um 16:49
-- Server-Version: 10.1.16-MariaDB
-- PHP-Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `rasp_watch`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin`
--

CREATE TABLE `admin` (
  `id` tinyint(11) NOT NULL,
  `name` tinytext NOT NULL,
  `perm` tinyint(4) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `admin`
--

INSERT INTO `admin` (`id`, `name`, `perm`, `password`, `email`) VALUES
(1, 'none', 0, '', ''),
(2, 'testUser1', 1, '12345', ''),
(3, 'testUser2', 1, '', ''),
(4, 'testUser3', 0, '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `typeId` tinyint(4) NOT NULL,
  `moduleId` tinyint(4) NOT NULL,
  `message` text NOT NULL,
  `statusId` tinyint(4) NOT NULL,
  `assignee` tinyint(4) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `messages`
--

INSERT INTO `messages` (`id`, `ip`, `time`, `typeId`, `moduleId`, `message`, `statusId`, `assignee`, `comment`) VALUES
(749, 6, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 4, 4, ''),
(750, 9, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 3, 4, ''),
(751, 7, 1474986838, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 4, 4, ''),
(752, 6, 1474986838, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 3, 3, ''),
(753, 7, 1474986838, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 3, 2, ''),
(754, 4, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 2, 4, ''),
(755, 6, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 1, 3, ''),
(756, 8, 1474986958, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 3, 4, ''),
(757, 10, 1474986958, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 3, 3, ''),
(758, 4, 1474986959, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 3, 2, ''),
(759, 8, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 0, 1, ''),
(760, 6, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 1, 4, ''),
(761, 10, 1474987014, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 3, 3, ''),
(762, 5, 1474987014, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 1, 2, 'abc'),
(763, 1, 0, 1, 1, 'TEST MESSAGE 1', 3, 2, ''),
(764, 9, 0, 1, 2, 'TEST MESSAGE 2', 0, 1, ''),
(765, 7, 0, 1, 3, 'TEST MESSAGE 3', 3, 3, ''),
(766, 9, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 1, 2, ''),
(767, 3, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 1, 4, ''),
(768, 9, 1474986838, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 3, 2, ''),
(769, 5, 1474986838, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 3, 2, ''),
(770, 2, 1474986838, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 4, 2, ''),
(771, 0, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 2, 3, ''),
(772, 10, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 2, 4, ''),
(773, 8, 1474986958, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 1, 3, ''),
(774, 6, 1474986958, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 0, 1, ''),
(775, 8, 1474986959, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 3, 3, ''),
(776, 2, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 2, 4, ''),
(777, 0, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 4, 3, ''),
(778, 2, 1474987014, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 3, 2, ''),
(779, 7, 1474987014, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 0, 1, ''),
(780, 6, 0, 1, 1, 'TEST MESSAGE 1', 0, 1, ''),
(781, 2, 0, 1, 2, 'TEST MESSAGE 2', 4, 4, ''),
(782, 5, 0, 1, 3, 'TEST MESSAGE 3', 3, 2, ''),
(783, 2, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 4, 2, ''),
(784, 8, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 0, 1, ''),
(785, 3, 1474986838, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 4, 3, ''),
(786, 10, 1474986838, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 4, 3, ''),
(787, 4, 1474986838, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 3, 2, ''),
(788, 8, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 1, 2, ''),
(789, 10, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 4, 3, ''),
(790, 10, 1474986958, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 0, 1, ''),
(791, 7, 1474986958, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 1, 3, ''),
(792, 0, 1474986959, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 4, 2, ''),
(793, 1, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 4, 4, ''),
(794, 4, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 4, 3, ''),
(795, 6, 1474987014, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 2, 2, ''),
(796, 9, 1474987014, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 2, 2, ''),
(797, 5, 0, 1, 1, 'TEST MESSAGE 1', 0, 1, ''),
(798, 3, 0, 1, 2, 'TEST MESSAGE 2', 1, 2, ''),
(799, 10, 0, 1, 3, 'TEST MESSAGE 3', 2, 2, ''),
(800, 1, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 3, 2, ''),
(801, 1, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 1, 4, ''),
(802, 5, 1474986838, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 4, 2, ''),
(803, 7, 1474986838, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 0, 1, ''),
(804, 0, 1474986838, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 0, 1, ''),
(805, 5, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 0, 1, ''),
(806, 8, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 1, 4, ''),
(807, 5, 1474986958, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 3, 3, ''),
(808, 4, 1474986958, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 1, 2, ''),
(809, 4, 1474986959, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 0, 1, ''),
(810, 3, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 4, 3, ''),
(811, 4, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 1, 3, ''),
(812, 0, 1474987014, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 4, 2, ''),
(813, 9, 1474987014, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 1, 4, ''),
(814, 8, 0, 1, 1, 'TEST MESSAGE 1', 1, 3, ''),
(815, 2, 0, 1, 2, 'TEST MESSAGE 2', 3, 2, ''),
(816, 6, 0, 1, 3, 'TEST MESSAGE 3', 0, 1, 'tzreztrzre'),
(817, 0, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 0, 1, ''),
(818, 7, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 4, 4, ''),
(819, 5, 1474986838, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 4, 4, ''),
(820, 1, 1474986838, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 2, 4, ''),
(821, 6, 1474986838, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 2, 2, ''),
(822, 8, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 1, 4, ''),
(823, 7, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 2, 2, ''),
(824, 5, 1474986958, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 3, 3, ''),
(825, 3, 1474986958, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 3, 4, ''),
(826, 7, 1474986959, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 2, 4, ''),
(827, 3, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 4, 2, ''),
(828, 1, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 1, 2, ''),
(829, 3, 1474987014, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 3, 4, ''),
(830, 0, 1474987014, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 0, 1, ''),
(831, 10, 0, 1, 1, 'TEST MESSAGE 1', 1, 3, ''),
(832, 3, 0, 1, 2, 'TEST MESSAGE 2', 4, 3, ''),
(833, 10, 0, 1, 3, 'TEST MESSAGE 3', 3, 2, ''),
(834, 0, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 2, 4, ''),
(835, 3, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 4, 2, ''),
(836, 10, 1474986838, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 4, 3, ''),
(837, 5, 1474986838, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 3, 2, ''),
(838, 1, 1474986838, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 4, 4, ''),
(839, 3, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 1, 4, ''),
(840, 1, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 0, 1, ''),
(841, 7, 1474986958, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 2, 3, ''),
(842, 4, 1474986958, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 0, 1, 'hghdghftzrzrABC\ngffgdgdf'),
(843, 6, 1474986959, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 2, 2, ''),
(844, 4, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 4, 2, ''),
(845, 7, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 3, 3, ''),
(846, 9, 1474987014, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 3, 4, ''),
(847, 7, 1474987014, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 1, 2, ''),
(848, 2, 0, 1, 1, 'TEST MESSAGE 1', 4, 2, ''),
(849, 9, 0, 1, 2, 'TEST MESSAGE 2', 1, 4, ''),
(850, 10, 0, 1, 3, 'TEST MESSAGE 3', 4, 4, ''),
(851, 1, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 2, 2, ''),
(852, 8, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 1, 2, ''),
(853, 7, 1474986838, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 4, 4, ''),
(854, 10, 1474986838, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 0, 1, ''),
(855, 8, 1474986838, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 3, 2, ''),
(856, 8, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 1, 4, ''),
(857, 4, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 4, 2, ''),
(858, 1, 1474986958, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 3, 3, ''),
(859, 9, 1474986958, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 3, 2, ''),
(860, 7, 1474986959, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 0, 1, ''),
(861, 5, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 2, 3, ''),
(862, 2, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 2, 4, ''),
(863, 7, 1474987014, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 4, 3, ''),
(864, 8, 1474987014, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 0, 1, ''),
(865, 3, 0, 1, 1, 'TEST MESSAGE 1', 2, 4, ''),
(866, 10, 0, 1, 2, 'TEST MESSAGE 2', 2, 4, ''),
(867, 2, 0, 1, 3, 'TEST MESSAGE 3', 3, 4, ''),
(868, 2, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 1, 2, ''),
(869, 1, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 2, 2, ''),
(870, 9, 1474986838, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 4, 2, ''),
(871, 9, 1474986838, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 1, 3, ''),
(872, 3, 1474986838, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 0, 1, ''),
(873, 2, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 3, 4, ''),
(874, 10, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 3, 4, ''),
(875, 3, 1474986958, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 1, 3, ''),
(876, 10, 1474986958, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 1, 3, ''),
(877, 5, 1474986959, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 0, 1, ''),
(878, 9, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 4, 2, ''),
(879, 10, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 0, 1, ''),
(880, 9, 1474987014, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 0, 1, ''),
(881, 4, 1474987014, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 4, 4, ''),
(882, 10, 0, 1, 1, 'TEST MESSAGE 1', 3, 4, ''),
(883, 1, 0, 1, 2, 'TEST MESSAGE 2', 2, 2, ''),
(884, 8, 0, 1, 3, 'TEST MESSAGE 3', 2, 2, ''),
(885, 2, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 0, 1, ''),
(886, 5, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 3, 2, ''),
(887, 1, 1474986838, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 3, 3, ''),
(888, 3, 1474986838, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 4, 2, ''),
(889, 9, 1474986838, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 0, 1, ''),
(890, 9, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 0, 1, ''),
(891, 6, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 4, 2, ''),
(892, 8, 1474986958, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 2, 3, ''),
(893, 1, 1474986958, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 4, 3, ''),
(894, 0, 1474986959, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 0, 1, ''),
(895, 10, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 1, 4, ''),
(896, 9, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 3, 4, ''),
(897, 1, 1474987014, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 1, 2, ''),
(898, 7, 1474987014, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 2, 3, ''),
(899, 2, 0, 1, 1, 'TEST MESSAGE 1', 3, 4, ''),
(900, 3, 0, 1, 2, 'TEST MESSAGE 2', 2, 2, ''),
(901, 6, 0, 1, 3, 'TEST MESSAGE 3', 3, 2, ''),
(902, 9, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 0, 1, ''),
(903, 9, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 0, 1, ''),
(904, 2, 1474986838, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 2, 3, ''),
(905, 4, 1474986838, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 1, 4, ''),
(906, 1, 1474986838, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 1, 2, ''),
(907, 2, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 4, 3, ''),
(908, 5, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 1, 4, ''),
(909, 0, 1474986958, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 4, 3, ''),
(910, 2, 1474986958, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 4, 3, ''),
(911, 2, 1474986959, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 0, 1, ''),
(912, 2, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 3, 3, ''),
(913, 7, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 2, 3, ''),
(914, 4, 1474987014, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 4, 3, ''),
(915, 10, 1474987014, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 1, 4, ''),
(916, 5, 0, 1, 1, 'TEST MESSAGE 1', 2, 2, ''),
(917, 8, 0, 1, 2, 'TEST MESSAGE 2', 0, 1, ''),
(918, 5, 0, 1, 3, 'TEST MESSAGE 3', 0, 1, ''),
(919, 0, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 0, 1, ''),
(920, 1, 1474986838, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 0, 1, ''),
(921, 4, 1474986838, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 2, 4, ''),
(922, 7, 1474986838, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 0, 1, ''),
(923, 2, 1474986838, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 4, 2, ''),
(924, 8, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 2, 4, ''),
(925, 7, 1474986958, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 3, 4, ''),
(926, 8, 1474986958, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 1, 2, ''),
(927, 1, 1474986958, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 0, 1, ''),
(928, 10, 1474986959, 4, 0, 'unbekannter und unbehandelter Fehler: \\ Traceback (most recent call last): \\ File ''tms-status.py'', line 342, in <module> \\ sendlog() \\ File ''tms-status.py'', line 297, in sendlog \\ response = requests.post(url, data={''status'': json}) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 94, in post \\ return request(''post'', url, data=data, json=json, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/api.py'', line 49, in request \\ return session.request(method=method, url=url, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 457, in request \\ resp = self.send(prep, **send_kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/sessions.py'', line 569, in send \\ r = adapter.send(request, **kwargs) \\ File ''/usr/lib/python2.7/dist-packages/requests/adapters.py'', line 407, in send \\ raise ConnectionError(err, request=request) \\ ConnectionError: (''Connection aborted.'', error(101, ''Network is unreachable''))', 4, 3, ''),
(929, 10, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 15d9:0a4d: Trust International B.V. Optical Mouse', 4, 4, ''),
(930, 5, 1474987014, 4, 0, 'Es fehlt das USB-Gerät 0461:0010: Primax Electronics, Ltd HP Keyboard', 0, 1, ''),
(931, 3, 1474987014, 3, 0, 'Es wurde ein unbekanntes USB-Gerät mit der ID 045e:0745 gefunden: Microsoft Corp. Nano Transceiver v1.0 for Bluetooth', 2, 4, ''),
(932, 3, 1474987014, 3, 0, 'Es wurde ein unbekanntes HDMI-Gerät gefunden: device_name=SEC-EPSON_PJ \\ ', 0, 1, ''),
(933, 6, 0, 1, 1, 'TEST MESSAGE 1', 3, 4, ''),
(934, 4, 0, 1, 2, 'TEST MESSAGE 2', 1, 2, ''),
(935, 8, 0, 1, 3, 'TEST MESSAGE 3', 2, 3, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messagestatus`
--

CREATE TABLE `messagestatus` (
  `id` tinyint(4) NOT NULL,
  `name` tinytext NOT NULL,
  `bootstrapName` tinytext NOT NULL,
  `tagName` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `messagestatus`
--

INSERT INTO `messagestatus` (`id`, `name`, `bootstrapName`, `tagName`) VALUES
(0, 'unzugewiesen', 'table-warning', 'tag-warning'),
(1, 'zugewiesen', 'table-assigned', 'tag-primary'),
(2, 'in Bearbeitung', 'table-info', 'tag-info'),
(3, 'fertig', 'table-success', 'tag-success'),
(4, 'unvollendet', 'table-danger', 'tag-danger');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `module`
--

INSERT INTO `module` (`id`, `name`) VALUES
(0, 'status'),
(1, 'mediaplayer'),
(2, 'youtube'),
(3, 'mediathek');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `room`
--

CREATE TABLE `room` (
  `ip` int(11) NOT NULL,
  `number` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `room`
--

INSERT INTO `room` (`ip`, `number`) VALUES
(1, 123),
(2, 1234),
(3, 675),
(4, 100),
(654654, 139);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `status`
--

CREATE TABLE `status` (
  `ip` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `memory` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `status`
--

INSERT INTO `status` (`ip`, `time`, `memory`) VALUES
(1, 1479217097, 13998),
(1, 1479217099, 84525),
(1, 1479217101, 77460),
(1, 1479217103, 1730),
(1, 1479217105, 86820),
(1, 1479217167, 99747),
(1, 1479217176, 73642),
(1, 1479218013, 52582),
(1, 1479218015, 88569),
(1, 1479218022, 8929),
(1, 1479218024, 43143);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `type`
--

CREATE TABLE `type` (
  `id` tinyint(4) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(0, 'NOTSET'),
(1, 'DEBUG'),
(2, 'INFO'),
(3, 'WARNING'),
(4, 'ERROR'),
(5, 'CRITICAL');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `messagestatus`
--
ALTER TABLE `messagestatus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indizes für die Tabelle `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`ip`);

--
-- Indizes für die Tabelle `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `admin`
--
ALTER TABLE `admin`
  MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=936;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
