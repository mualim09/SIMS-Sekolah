<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ViewClass extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'v_class';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
}
