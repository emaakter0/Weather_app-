import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather UI',
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // solid gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3E2D8F), Color(0xFF9D52AC)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 428),
              child: const _Body(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 6),
          // Title + min/max
          const Text(
            'North America',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Max: 24°   Min:18°',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 28),

          // Section header frame
          Container(
            width: double.infinity,
            height: 63,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0x80F7CBFD)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: const Text(
              '7-Days Forecasts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ===== 4 rectangles visible together (no scroll) =====
          SizedBox(
            height: 172,
            child: Row(
              children: const [
                Expanded(child: _ForecastPill(temp: '19°C', day: 'Mon')),
                SizedBox(width: 10),
                Expanded(child: _ForecastPill(temp: '18°C', day: 'Tue')),
                SizedBox(width: 10),
                Expanded(child: _ForecastPill(temp: '18°C', day: 'Wed')),
                SizedBox(width: 10),
                Expanded(child: _ForecastPill(temp: '19°C', day: 'Thu')),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Air Quality card
          Container(
            width: 352,
            height: 174,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF3E2D8F), Color(0xFF9D52AC)],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x40504E4E),
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: const [
                    Icon(CupertinoIcons.location, color: Colors.white, size: 20),
                    SizedBox(width: 10),
                    Text(
                      'AIR QUALITY',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ]),
                  const SizedBox(height: 12),
                  const Text(
                    '3-Low Health Risk',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 5,
                    width: 308,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF362A84),
                          Color(0xD0825BCA),
                          Color(0xFFBD08FC),
                        ],
                        stops: [0.0792, 0.50, 0.50],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'See more',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 6),
                      Icon(CupertinoIcons.right_chevron,
                          size: 18, color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Bottom two small cards
          Row(
            children: const [
              SizedBox(width: 16),
              _SmallCard.sunrise(),
              SizedBox(width: 14),
              _SmallCard.uvIndex(),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}

class _ForecastPill extends StatelessWidget {
  final String temp;
  final String day;
  const _ForecastPill({required this.temp, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF3E2D8F), Color(0xFF8E78C8)],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            temp,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          const Icon(CupertinoIcons.cloud_rain, color: Colors.white, size: 34),
          const SizedBox(height: 10),
          Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18, // a little smaller so 4 fit nicely
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallCard extends StatelessWidget {
  final String title;
  final String big;
  final String small;
  final IconData icon;

  const _SmallCard({
    required this.title,
    required this.big,
    required this.small,
    required this.icon,
  });

  const _SmallCard.sunrise()
      : this(
    title: 'SUNRISE',
    big: '5:28 AM',
    small: 'Sunset: 7.25PM',
    icon: CupertinoIcons.sun_max,
  );

  const _SmallCard.uvIndex()
      : this(
    title: 'UV INDEX',
    big: '4',
    small: 'Moderate',
    icon: CupertinoIcons.sun_dust,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment(0.20, -1.0),
            end: Alignment(-0.8, 1.0),
            colors: [Color(0xFF3E2D8F), Color(0x009D52AC)],
            stops: [0.1714, 0.9459],
          ),
          border: Border.all(color: Color(0xFFF7CBFD)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
            ]),
            const Spacer(),
            Text(
              big,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(small, style: const TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}