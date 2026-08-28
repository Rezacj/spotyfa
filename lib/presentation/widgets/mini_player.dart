import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class MiniPlayer extends StatelessWidget {
  final String songTitle;
  final String artistName;
  final bool isPlaying;
  final VoidCallback? onPlayPauseTap;
  final VoidCallback? onTap;

  const MiniPlayer({
    super.key,
    required this.songTitle,
    required this.artistName,
    this.isPlaying = false,
    this.onPlayPauseTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 22,
              sigmaY: 22,
            ),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                // گرادیان پس‌زمینه
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.08),
                    Colors.white.withOpacity(0.03),
                    Colors.white.withOpacity(0.06),
                  ],
                ),

                // پس‌زمینه تیره با شفافیت
                color: AppColors.tertiary.withOpacity(0.4),

                // Glass border
                border: Border.all(
                  color: Colors.white.withOpacity(0.12),
                  width: 0.8,
                ),

                // Soft shadow
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 20,
                    spreadRadius: -6,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Top glass highlight
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 0,
                    child: IgnorePointer(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.white.withOpacity(0.3),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Bottom subtle highlight
                  Positioned(
                    left: 50,
                    right: 50,
                    bottom: 0,
                    child: IgnorePointer(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.white.withOpacity(0.08),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Progress bar
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 2,
                      color: Colors.white.withOpacity(0.05),
                      child: FractionallySizedBox(
                        widthFactor: 0.33,
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.5),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        // Album art
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.music_note_rounded,
                            size: 22,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Title and artist
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                songTitle,
                                style: AppTextStyles.miniPlayerTitle.copyWith(
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                artistName,
                                style: AppTextStyles.miniPlayerArtist.copyWith(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        // Play/Pause button
                        GestureDetector(
                          onTap: onPlayPauseTap,
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: isPlaying
                                  ? AppColors.primary.withOpacity(0.2)
                                  : Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle,
                              boxShadow: isPlaying
                                  ? [
                                      BoxShadow(
                                        color:
                                            AppColors.primary.withOpacity(0.3),
                                        blurRadius: 8,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Icon(
                              isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              size: 20,
                              color:
                                  isPlaying ? AppColors.primary : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
