import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/storage.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  bool _isLoading = false;
  String _success = '';
  String _error = '';

  Future<void> _reset() async {
    setState(() {
      _isLoading = true;
      _success = '';
      _error = '';
    });

    try {
      await Storage().delete('kubenav-settings');
      await Storage().delete('kubenav-crds');
      await Storage().delete('kubenavClustersRepository');
      await Storage().delete('kubenav-bookmarks-v5');
      await Storage().delete('kubenav-theme');
      setState(() {
        _isLoading = false;
        _success = 'App data was deleted. You can restart the app now.';
        _error = '';
      });
    } catch (err) {
      setState(() {
        _isLoading = false;
        _success = '';
        _error = 'Failed to delete app data: $err.';
      });
    }
  }

  Widget _buildStatus(String success, String error) {
    if (success != '') {
      return Padding(
        padding: EdgeInsets.all(Constants.spacingMiddle),
        child: Text(success, textAlign: TextAlign.center),
      );
    }
    if (error != '') {
      return Padding(
        padding: EdgeInsets.all(Constants.spacingMiddle),
        child: Text(error, textAlign: TextAlign.center),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'kubenav',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(Constants.spacingMiddle),
                child: Text(
                  'Click the reset button to delete all existing providers, clusters and settings. Please be aware that this can not be undone. If you delete all existing providers, clusters and settings you have to re-add them manually.',
                  textAlign: TextAlign.center,
                ),
              ),
              _buildStatus(_success, _error),
              Padding(
                padding: EdgeInsets.all(Constants.spacingMiddle),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff326ce5),
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Constants.sizeBorderRadius,
                      ),
                    ),
                  ),
                  onPressed: _isLoading ? null : _reset,
                  child:
                      _isLoading
                          ? SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                          : Text(
                            'Reset',
                            style: primaryTextStyle(
                              context,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
