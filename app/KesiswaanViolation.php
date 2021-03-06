<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class KesiswaanViolation extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'kesiswaan_violation';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'score',
    ];
}
