import React, { useState } from 'react';
import { Search, MapPin, Calendar, Users, Filter, Heart, Star } from 'lucide-react';
import { Card, CardContent } from '@/components/ui/card';

const AirbnbSearch = () => {
  const [selectedFilter, setSelectedFilter] = useState('');
  
  const listings = [
    {
      id: 1,
      title: "Luxury Villa with Ocean View",
      location: "Malibu, California",
      rating: 4.9,
      reviews: 128,
      price: 599,
      images: ["/api/placeholder/400/300"],
      dates: "Jan 20-25",
      type: "Entire villa"
    },
    {
      id: 2,
      title: "Modern Downtown Loft",
      location: "New York City",
      rating: 4.8,
      reviews: 256,
      price: 299,
      images: ["/api/placeholder/400/300"],
      dates: "Jan 22-27",
      type: "Entire apartment"
    },
    {
      id: 3,
      title: "Cozy Mountain Cabin",
      location: "Aspen, Colorado",
      rating: 4.95,
      reviews: 89,
      price: 399,
      images: ["/api/placeholder/400/300"],
      dates: "Feb 1-5",
      type: "Entire cabin"
    }
  ];

  const filters = [
    "Price", "Type of place", "Rooms and beds", "Amenities",
    "Booking options", "Accessibility features", "Top tier stays"
  ];

  return (
    <div className="min-h-screen bg-white">
      {/* Header */}
      <header className="border-b">
        <div className="container mx-auto px-4 py-4">
          {/* Search Bar */}
          <div className="flex items-center justify-center">
            <div className="flex items-center space-x-4 border rounded-full p-2 shadow-sm hover:shadow-md cursor-pointer">
              <div className="px-4 border-r">
                <div className="font-medium">Where</div>
                <div className="text-sm text-gray-500">Search destinations</div>
              </div>
              <div className="px-4 border-r">
                <div className="font-medium">Check in</div>
                <div className="text-sm text-gray-500">Add dates</div>
              </div>
              <div className="px-4 border-r">
                <div className="font-medium">Check out</div>
                <div className="text-sm text-gray-500">Add dates</div>
              </div>
              <div className="px-4 flex items-center">
                <div>
                  <div className="font-medium">Who</div>
                  <div className="text-sm text-gray-500">Add guests</div>
                </div>
                <button className="ml-4 bg-rose-500 text-white p-2 rounded-full">
                  <Search className="w-4 h-4" />
                </button>
              </div>
            </div>
          </div>
        </div>
      </header>

      {/* Filters */}
      <div className="container mx-auto px-4 py-4">
        <div className="flex items-center space-x-4 overflow-x-auto">
          {filters.map((filter) => (
            <button
              key={filter}
              className={`px-4 py-2 rounded-full border whitespace-nowrap
                ${selectedFilter === filter ? 'border-black bg-gray-100' : 'hover:border-black'}`}
              onClick={() => setSelectedFilter(filter)}
            >
              {filter}
            </button>
          ))}
          <button className="px-4 py-2 rounded-full border flex items-center space-x-2">
            <Filter className="w-4 h-4" />
            <span>Filters</span>
          </button>
        </div>
      </div>

      {/* Listings */}
      <main className="container mx-auto px-4 py-8">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {listings.map((listing) => (
            <Card key={listing.id} className="overflow-hidden">
              <CardContent className="p-0">
                <div className="relative">
                  <img
                    src={listing.images[0]}
                    alt={listing.title}
                    className="w-full aspect-square object-cover rounded-t-lg"
                  />
                  <button className="absolute top-4 right-4 text-gray-700 hover:text-rose-500">
                    <Heart className="w-6 h-6" />
                  </button>
                </div>
                <div className="p-4">
                  <div className="flex justify-between items-start">
                    <div>
                      <h3 className="font-medium">{listing.title}</h3>
                      <p className="text-gray-500">{listing.type}</p>
                      <p className="text-gray-500">{listing.dates}</p>
                      <div className="mt-2">
                        <span className="font-semibold">${listing.price}</span>
                        <span className="text-gray-500"> night</span>
                      </div>
                    </div>
                    <div className="flex items-center space-x-1">
                      <Star className="w-4 h-4 fill-current" />
                      <span>{listing.rating}</span>
                      <span className="text-gray-500">({listing.reviews})</span>
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      </main>
    </div>
  );
};

export default AirbnbSearch;

