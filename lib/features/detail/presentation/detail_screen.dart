import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../features/home/domain/entities/exhibit_entity.dart';

class DetailScreen extends StatefulWidget {
  final ExhibitEntity exhibit;

  const DetailScreen({super.key, required this.exhibit});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    if (widget.exhibit.audioUrl != null) {
      // Thiết lập listener cho trạng thái Player
      _audioPlayer.onPlayerStateChanged.listen((state) {
        if (mounted) {
          setState(() {
            _isPlaying = state == PlayerState.playing;
          });
        }
      });

      // Lắng nghe độ dài bài hát
      _audioPlayer.onDurationChanged.listen((newDuration) {
        if (mounted) {
          setState(() {
            _duration = newDuration;
          });
        }
      });

      // Lắng nghe vị trí hiện tại
      _audioPlayer.onPositionChanged.listen((newPosition) {
        if (mounted) {
          setState(() {
            _position = newPosition;
          });
        }
      });

      // Set source nhưng không phát ngay (hoặc dùng setSourceAsset nếu chuẩn file nằm trong thư mục assets do app bundle)
      await _audioPlayer.setSourceAsset('audio/${widget.exhibit.audioUrl}');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final exhibit = widget.exhibit;
    final hasAudio = exhibit.audioUrl != null;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 250,
                  pinned: true,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_rounded,
                        color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: [
                    IconButton(
                      icon:
                          const Icon(Icons.share_rounded, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          color: AppColors.divider,
                          child: Center(
                            child: Container(
                              color: AppColors.divider,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/Dinh_doc_lap.webp'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.6),
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.8),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 20,
                          right: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: exhibit.isRoom
                                      ? AppColors.primary
                                      : AppColors.gold,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '${exhibit.isRoom ? 'PHÒNG SỐ' : 'HIỆN VẬT MÃ'} ${exhibit.pinCode}',
                                  style: TextStyle(
                                    color: exhibit.isRoom
                                        ? Colors.white
                                        : AppColors.primaryDark,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                exhibit.name.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.info_outline_rounded,
                                color: AppColors.primary, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Thông tin chi tiết',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          exhibit.description,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (hasAudio)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (_isPlaying) {
                        await _audioPlayer.pause();
                      } else {
                        await _audioPlayer.resume();
                      }
                    },
                    child: Icon(
                      _isPlaying
                          ? Icons.pause_circle_filled_rounded
                          : Icons.play_circle_fill_rounded,
                      color: AppColors.primary,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${_formatDuration(_position)} / ${_formatDuration(_duration)}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 2,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 6),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 12),
                        activeTrackColor: AppColors.gold,
                        inactiveTrackColor: Colors.black12,
                        thumbColor: AppColors.gold,
                      ),
                      child: Slider(
                        min: 0,
                        max: _duration.inSeconds.toDouble(),
                        value: _position.inSeconds
                            .toDouble()
                            .clamp(0.0, _duration.inSeconds.toDouble()),
                        onChanged: (value) async {
                          final position = Duration(seconds: value.toInt());
                          await _audioPlayer.seek(position);
                          // Tùy chọn: resume() nếu muốn tự động hát khi vừa thả thanh seekbar
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
